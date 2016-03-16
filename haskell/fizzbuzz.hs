module Main where

fizzbuzz :: Int -> IO()
fizzbuzz n = do
  putStrLn (fizzbuzzStr n)


fizzbuzzStr :: Int -> String
fizzbuzzStr n =
  if ((n `rem` 3) == 0) && ((n `rem` 5) == 0)
    then "FizzBuzz"
    else if (n `rem` 3) == 0 
      then "Fizz"
      else if (n `rem` 5) == 0 
        then "Buzz"
        else show n

main :: IO()
main = mapM_ fizzbuzz [1..100]
