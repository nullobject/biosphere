{-# LANGUAGE DeriveDataTypeable #-}

module Organism (Organism, mkOrganism, step) where

import Genome (Genome)
import Text.JSON.Generic (Data)

data State = Idle | Feeding | Dead deriving (Data, Eq, Show)

-- | An organism is a life form.
data Organism = Organism
  { state :: State,
    genome :: Genome,
    age :: Int,
    health :: Int,
    lastFeed :: Int,
    lastReproduce :: Int
  }
  deriving (Data, Show)

-- | Builds an organism from a genome.
mkOrganism :: Genome -> Organism
mkOrganism g =
  Organism
    { state = Idle,
      genome = g,
      age = 0,
      health = 100,
      lastFeed = 0,
      lastReproduce = 0
    }

-- | Advances the simulation by one step.
--
-- If the organism is idle, and the time since the last feed is >=10 then it should feed.
step :: Organism -> Organism
step organism
  | state organism == Idle = mkOrganism $ genome organism
  | otherwise = organism
