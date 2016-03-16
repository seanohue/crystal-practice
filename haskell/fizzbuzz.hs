module Main where

main :: IO()
main = mapM_ fizzbuzz [1..100]

fizzbuzz :: Int -> IO()
fizzbuzz n = do
  putStrLn (fizzbuzzStr n)

fizzbuzzStr :: Int -> String
fizzbuzzStr n =
  if evenDiv n 3 && evenDiv n 5
    then "FizzBuzz"
    else if evenDiv n 3 
      then "Fizz"
      else if evenDiv n 5
        then "Buzz"
        else show n

evenDiv :: Int -> Int -> Bool
evenDiv x y = (x `rem` y) == 0




