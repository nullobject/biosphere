module Util where

import Data.List

average :: Fractional a => [a] -> a
average xs = sum xs / genericLength xs
