(block $block ;; 2
  (loop $outside_loop ;; 1
    (loop $inside_loop ;; 0
      br 0 ;; 内側のループの先頭にジャンプ
      br 1 ;; 外側のループの先頭にジャンプ
      br 2 ;; blockから抜ける
    )
  )
)


(block
  (block
    br 0 ;; 内側のblockを抜ける
    br 1 ;; 外側のblockを抜ける
  )
)


(loop
  (block
    br 1 ;; 外側のloopの先頭へジャンプ
  )
)

