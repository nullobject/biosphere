import Prelude (map, ($), IO, putStrLn, readFile)
import Genome (cross, Genome)
import Organism (buildOrganism)
import Text.JSON.Generic (decodeJSON, encodeJSON)
import Biotope (buildBiotope, step)

main :: IO ()
main = do
  json <- readFile "rabbit.json"
  let rabbit = decodeJSON json :: Genome

  json <- readFile "pig.json"
  let pig = decodeJSON json :: Genome

  let mutant = rabbit `cross` pig

  let genomes = [rabbit, rabbit, pig, pig, mutant, mutant]
  let organisms = map buildOrganism genomes
  let biotope = buildBiotope organisms

  putStrLn $ encodeJSON $ Biotope.step biotope
