import System.IO

instructions =
    "Enter commands using one or two words.\n" ++
    "Available commands are:\n" ++
    "game             -- to start the game.\n" ++
    "n  s  e  w  u  d   -- to go in that direction.\n" ++
    "take object        -- to pick up the named object.\n" ++
    "drop object        -- to put down the named object.\n" ++
    "hit               -- to attack an enemy.\n" ++


    "i                  -- to see your inventory (what you are holding).\n" ++
    "quit               -- to end the game and quit.\n"++
    "Input which direction you want to take "
game :: IO ()
game = do putStrLn instructions
          direction <- getLine
          putStrLn "input which road you want to start your adventure:"
          play direction
  
play :: String -> IO ()
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "game over!"
      else
         do putStrLn (match direction guess)
            play direction 

match :: String -> String -> String
match xs ys = description xs ys


description :: String->String -> String
description "w" "road1" = "You are on road1.\n" ++
    "To the north is the gas station\n" ++
    "behind the gas station there is road2;\n"++
    "to the south is a small road5.\n" ++
    "Your assignment, is to\n" ++
    "recover the car\n" ++
    ""
description "w" "road2" = 
    "Congratulations!!  You have recovered the car, you are a winner!!!"
description "w" "road3" =
    "Go and get my car!!!"
description _ "s road4"= "your direction is south on road4"

description _ "n road4"= "your direction is north on road4"

description _ _ = "this road is not avalable."
