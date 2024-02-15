{-# LANGUAGE DeriveDataTypeable #-}

module Genome (Genome, mkGenome, cross) where

import Gene (Gene, mix)
import Text.JSON.Generic (Data)

data Genome = Genome
  { name :: String,
    genes :: [Gene]
  }
  deriving (Data, Eq, Show)

mkGenome :: String -> [Gene] -> Genome
mkGenome name genes = Genome {Genome.name = name, Genome.genes = genes}

-- | Crosses two genomes together to produce a third genome.
cross :: Genome -> Genome -> Genome
cross a b = mkGenome (Genome.name a ++ Genome.name b) (mix (genes a) (genes b))
