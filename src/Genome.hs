{-# LANGUAGE DeriveDataTypeable #-}

module Genome where

import Gene (Gene, mix)
import Text.JSON.Generic (Data)

data Genome = Genome
  { name :: String,
    genes :: [Gene]
  }
  deriving (Data, Eq, Show)

buildGenome :: String -> [Gene] -> Genome
buildGenome name genes = Genome {Genome.name = name, Genome.genes = genes}

-- | Crosses two genomes together to produce a third genome.
cross :: Genome -> Genome -> Genome
cross a b = buildGenome (Genome.name a ++ Genome.name b) (mix (genes a) (genes b))
