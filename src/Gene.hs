{-# LANGUAGE DeriveDataTypeable #-}

module Gene (Gene, mkGene, mix) where

import Data.List (groupBy, sort)
import Text.JSON.Generic (Data)
import Util (average)

data Gene = Gene
  { name :: String,
    value :: Double
  }
  deriving (Data, Eq, Ord, Show)

mkGene :: String -> Double -> Gene
mkGene name value = Gene {Gene.name = name, Gene.value = value}

groupByName :: [Gene] -> [[Gene]]
groupByName = groupBy (\x y -> name x == name y) . sort

averageValue :: [Gene] -> Double
averageValue = average . map value

averageGene :: [Gene] -> Gene
averageGene xs@(x : _) = mkGene (name x) (averageValue xs)

mix :: [Gene] -> [Gene] -> [Gene]
mix a b = map averageGene groups
  where
    groups = groupByName (a ++ b)
