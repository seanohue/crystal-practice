module FizzBuzz where

main :: IO()
main = mapM_ fizzbuzz [1..100]

fizzbuzz :: Int -> IO()
fizzbuzz n = do
  putStrLn (fizzbuzzStr n)

fizzbuzzStr :: Int -> String
fizzbuzzStr n | evenDiv n 3 && evenDiv n 5 = "FizzBuzz"
              | evenDiv n 3                = "Fizz"
              | evenDiv n 5                = "Buzz"
              | otherwise                  = show n

evenDiv :: Int -> Int -> Bool
evenDiv x y = (x `rem` y) == 0




