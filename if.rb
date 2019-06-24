condition = false

while true
  catch(:exit) do
    if condition
      throw(:exit) # 0だとthrow
      puts 'if'
    else
      break # 1だとbreak
      puts 'else'
    end
  end

  break
end

puts 'finished'
