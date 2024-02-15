{-# LANGUAGE DeriveDataTypeable #-}

module Biotope (Biotope, mkBiotope, step) where

import Organism (Organism)
import qualified Organism (step)
import Text.JSON.Generic (Data)

-- | A biotope is an area of uniform environmental conditions providing a living
-- place for a specific assemblage of plants and animals.
data Biotope = Biotope
  { food :: Int,
    organisms :: [Organism]
  }
  deriving (Data, Show)

-- | Builds a biotope from a list of organisms.
mkBiotope :: [Organism] -> Biotope
mkBiotope organisms =
  Biotope
    { Biotope.food = 100,
      Biotope.organisms = organisms
    }

-- | Advances the simulation by one step.
step :: Biotope -> Biotope
step biotope = mkBiotope $ map Organism.step $ organisms biotope
