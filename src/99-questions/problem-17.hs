{-|
 - Split a list into two parts; the length of the first part is given. Do not use any predefined predicates.
 - Example:
 -    split "abcdefghik" 3
 -    => ("abc", "defghik")
 -
|-} 

-- split :: [a] -> Int -> ([a], [a])
split list 0 = ([], list)
split [] _ = ([], [])
split list leftSize = foldr helper ([],[]) list
  where rightSize =  (length list) - leftSize
        helper z (x, y)
          | length y < rightSize = (x, z:y)
          | otherwise            = (z:x, y)

main = do
  putStrLn $ "split \"abcdefghik\" 3  : " ++ ( show $ split "abcdefghik" 3   )
  putStrLn $ "split \"abcdefghik\" 0  : " ++ ( show $ split "abcdefghik" 0   )
  putStrLn $ "split \"abcdefghik\" -5 : " ++ ( show $ split "abcdefghik" (-5))
  putStrLn $ "split \"abcdefghik\" 100: " ++ ( show $ split "abcdefghik" 100 )
  putStrLn $ "split ([]::[Int]) 0   : " ++ ( show $ split ([]::[Int]) 0      )
  putStrLn $ "split ([]::[Int]) 1   : " ++ ( show $ split ([]::[Int]) 1      )
  putStrLn $ "split ([]::[Int]) -1  : " ++ ( show $ split ([]::[Int]) (-1)   )

-- More solutions: https://wiki.haskell.org/99_questions/Solutions/17
