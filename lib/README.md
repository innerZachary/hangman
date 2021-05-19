Create a Hangman game that can be saved and continued later

Use class where the instance can be YAML dumped or YAML loaded with serialize/deserialize methods

Option to play new game or existing one.

Enter SAVE at any time to save the game

where does the YAML dump go?

I know it will involve YAML::dump(self)




Displayman
    ______      
    |    |
    O    |
   /|\   |
  "/ \"  |
  <   >  |
============

"1234------"
"1234|1234|"
"123456789|"
"123456789|"
"123456789|"
"123456789|"
"============"

"    ------\n    |    |\n         |\n         |\n         |\n         |\n============"
"    ------\n    |    |\n    O    |\n         |\n         |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /     |\n         |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /|    |\n         |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /|\\   |\n         |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /|\\   |\n  \"      |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /|\\   |\n  \"   \"  |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/  \"  |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n         |\n============"
"    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n  <      |\n============"
"    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n  <   >  |\n============"

hangman_arr = [
  "    ------\n    |    |\n         |\n         |\n         |\n         |\n============",
  "    ------\n    |    |\n    O    |\n         |\n         |\n         |\n============",
  "    ------\n    |    |\n    O    |\n   /     |\n         |\n         |\n============",
  "    ------\n    |    |\n    O    |\n   /|    |\n         |\n         |\n============",
  "    ------\n    |    |\n    O    |\n   /|\\   |\n         |\n         |\n============",
  "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"      |\n         |\n============",
  "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"   \"  |\n         |\n============",
  "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n         |\n============",
  "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n  <      |\n============",
  "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n  <   >  |\n============"
]