catch(:block1) do
  while true
    catch(:block0) do
      while true
        throw(:block0) # ラベル付きbreakが無いので
        throw(:block1) # blockでもcatch-throwを使う
        break
      end
    end

    break
  end
end


while true
  loop = catch(:block) do
    while true
      throw(:block, true)

      break
    end
  end

  # loopの先頭に戻るための
  # 変数を導入する
  next if loop

  break
end

