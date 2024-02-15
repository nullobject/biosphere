-- An organism is a life form.
module Organism where

import Genome (Genome)

data State = Idle | Feeding | Dead deriving (Eq, Show)

data Organism = Organism
  { state         :: State
  , genome        :: Genome
  , age           :: Int
  , health        :: Int
  , lastFeed      :: Int
  , lastReproduce :: Int
  } deriving (Show)

-- | Builds an organism from a genome.
buildOrganism :: Genome -> Organism
buildOrganism g = Organism
  { state         = Idle
  , genome        = g
  , age           = 0
  , health        = 100
  , lastFeed      = 0
  , lastReproduce = 0
  }

-- Advances the simulation by one step.
--
-- If the organism is idle, and the time since the last feed is >=10 then it should feed.
--
step :: Organism -> Organism
step organism
  | state organism == Idle = buildOrganism $ genome organism
  | otherwise = organism
