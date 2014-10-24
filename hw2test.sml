(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw2.sml";

val test1 = all_except_option("string", ["string"]) = SOME []
val test1_2 = all_except_option("string", ["strings"]) = NONE
val test1_3 = all_except_option("string", ["string", "strings"]) = SOME ["strings"]

val test2 = get_substitutions1([["foo"],["there"]], "foo") = []
val test2_2 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") = ["Fredrick","Freddie","F"]
val test2_3 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test3 = get_substitutions2([["foo"],["there"]], "foo") = []
val test3_2 = get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") = ["Fredrick","Freddie","F"]
val test3_3 = get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test4 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
	     {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test5 = card_color((Clubs, Num 2)) = Black
val test5_2 = card_color((Diamonds, Num 2)) = Red

val test6 = card_value((Clubs, Num 2)) = 2
val test6_2 = card_value((Clubs, Ace)) = 11
val test6_3 = card_value((Clubs, Queen)) = 10

val test7 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7_2 = remove_card([(Hearts, Ace), (Diamonds, Ace)], (Hearts, Ace), IllegalMove) = [(Diamonds, Ace)]
val test7_3 = ((remove_card([],(Hearts, Ace), IllegalMove); false) handle IllegalMove => true)

val test8 = all_same_color([(Hearts, Ace), (Diamonds, Ace)]) = true
val test8_2 = all_same_color([(Hearts, Ace), (Spades, Ace)]) = false
val test8_3 = all_same_color([(Hearts, Ace), (Diamonds, Ace), (Spades, Ace)]) = false

val test9 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4
val test9_2 = sum_cards([]) = 0
val test9_3 = sum_cards([(Clubs, Num 2),(Clubs, Ace),(Diamonds, Jack)]) = 23

val test10 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10_2 = score([(Hearts, Num 2),(Clubs, Num 8)],10) = 0
val test10_3 = score([(Hearts, Ace),(Clubs, Num 4)],10) = 15
val test10_4 = score([(Hearts, Ace),(Diamonds, Num 4)],10) = 7

val test11 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)

val test14 = score_challenge([(Hearts, Ace),(Clubs, Num 4)],10) = 5
val test14_2 = score_challenge([(Hearts, Ace),(Clubs, Ace),(Clubs, Num 1)],10) = 7

val test15 = officiate_challenge([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test15_2 = officiate_challenge([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test15_3 = ((officiate_challenge([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)

val test16 = careful_player([(Hearts, Num 2),(Clubs, Num 4)], 15) = [Draw, Draw, Draw]
val test16_2 = careful_player([(Hearts, Num 2),(Clubs, Num 4)], 6) = [Draw, Draw]
val test16_3 = careful_player([(Hearts, Num 2),(Clubs, Num 4)], 5) = [Draw]
val test16_4 = careful_player([(Hearts, Num 2),(Clubs, Num 4)], 4) = [Draw, Discard (Hearts, Num 2), Draw]
