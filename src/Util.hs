module Util where

import Data.List (genericLength)

average :: (Fractional a) => [a] -> a
average xs = sum xs / genericLength xs
