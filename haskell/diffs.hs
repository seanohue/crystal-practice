module Diffs where

difference :: Eq a => [a] -> [a] -> [a]
difference xs []     = xs
difference xs (y:ys) = difference (filter (/= y) xs) ys

-- Your goal in this kata is to implement an difference function, which subtracts one list from another.


