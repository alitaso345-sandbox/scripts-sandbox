require 'active_record'
require 'minitest/autorun'
require 'logger'

Minitest::Test = MiniTest::Unit::TestCase unless defined?(Minitest::Test)

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :posts, force: true do |t|
    t.string :name
  end

  create_table :comments, force: true do |t|
    t.integer :post_id
    t.string :author
    t.text :comment
  end
end

class Post < ActiveRecord::Base
  has_many :comments, validate: true
end

class Comment < ActiveRecord::Base
  belongs_to :post

  validates_uniqueness_of :author, scope: [:post_id]
end

class BugTest < Minitest::Test
  def test_save_bang_not_raising
    post = Post.new(name: 'test')
    author = 'Fabian'
    post.comments.build(author: author)
    post.comments.build(author: author)

    # This should raise (because post is invalid) but it does not
    assert_raises { post.save! }
  end
end
