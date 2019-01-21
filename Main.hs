import Biotope
import Genome
import Organism
import Text.JSON.Generic

main = do
  json <- readFile "rabbit.json"
  let rabbit = decodeJSON json :: Genome

  json <- readFile "pig.json"
  let pig = decodeJSON json :: Genome

  let mutant = rabbit `cross` pig

  let genomes = [rabbit, rabbit, pig, pig, mutant, mutant]
  let organisms = map (buildOrganism) genomes
  let biotope = buildBiotope organisms

  putStrLn $ show $ Biotope.step biotope
