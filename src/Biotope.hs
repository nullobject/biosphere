-- A biotope is an area of uniform environmental conditions providing a living place for a specific assemblage of plants and animals.
module Biotope where

import Organism

data Biotope = Biotope
  { food      :: Int
  , organisms :: [Organism]
  } deriving (Show)

-- | Builds a biotope from a list of organisms.
buildBiotope :: [Organism] -> Biotope
buildBiotope organisms = Biotope
  { Biotope.food      = 100
  , Biotope.organisms = organisms
  }

-- | Advances the simulation by one step.
step :: Biotope -> Biotope
step biotope = buildBiotope $ map Organism.step $ organisms biotope
  -- feed
  -- reproduce
