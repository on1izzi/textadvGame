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
    "Input which direction "
game :: IO ()
game = do putStrLn instructions
          direction <- getLine
          putStrLn "input which room are you going to enter:"
          play direction
  
play :: String -> IO ()
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "You won/game over!"
      else
         do putStrLn (match direction guess)
            play direction

match :: String -> String -> String
match xs ys = description xs ys

--need to add more options of the rooms, for example
-- description "s" "room4"= "you are inside room4"
description :: String->String -> String
description "w" "room1" = "You are in a room1.  To the north is the mouth\n" ++
    "of a room2; to the south is a small room5. Your\n" ++
	"assignment, should you decide to accept it, is to\n" ++
	"recover the ruby and return it to\n" ++
	"this room3."
description "w" "room2" = 
    "Congratulations!!  You have recovered the ruby and won the game."
description "s" "room1" =
    "You are in the mouth of a dank room2.  The exit is to\n" ++
    "the south; there is a large, dark, round passage to\n" ++
    "the east."
description _ "s room4"= "you are inside s room4"
description _ "n room4"= "you are inside n room4"
description _ _ = "you can't see anything."