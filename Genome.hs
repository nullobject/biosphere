{-# LANGUAGE DeriveDataTypeable #-}

module Genome where

import Text.JSON.Generic

import Gene (Gene, mix)

data Genome = Genome
  { name  :: String
  , genes :: [Gene]
  } deriving (Data, Eq, Show, Typeable)

buildGenome :: String -> [Gene] -> Genome
buildGenome name genes = Genome {Genome.name = name, Genome.genes = genes}

-- Crosses two genomes together to produce a third genome.
cross :: Genome -> Genome -> Genome
cross a b = buildGenome (Genome.name a) (mix (genes a) (genes b))
