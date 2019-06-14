require 'strong_json'

s = StrongJSON.new do
  let :item, object(name: string, count: numeric, price: numeric).ignore(Set.new([:comment]))
  let :items, array(item)
  let :checkout,
      object(items:    items,
             change:   optional(number),
             type:     enum(literal(1), symbol),
             customer: object?(
                         name:     string,
                         id:       string,
                         birthday: string,
                         gender:   enum(literal("man"), literal("woman"), literal("other")),
                         phone:    string
                       )
      )
end

pp s.checkout.coerce(items: [{ name: "test", count: 1, price: "2.33", comment: "dummy"}], type: 1)
#=>
# {:items=>[{:name=>"test", :count=>1, :price=>"2.33"}],
#  :change=>nil,
#  :type=>1,
#  :customer=>nil}

#pp s.checkout.coerce(items: [{ name: 1111, count: 1, price: "2.33", comment: "dummy"}], type: 1)
#=> in `coerce': TypeError at $.items[0].name: expected=string, value=1111 (StrongJSON::Type::TypeError)


