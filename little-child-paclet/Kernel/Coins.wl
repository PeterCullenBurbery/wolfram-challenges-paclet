(* ::Package:: *)

BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Coins;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[Coins]

Coins::usage = "Coins[values][target] returns the number of coins of each value in values that sum to target. Coins[target] is a function that returns a function that takes a list of values as an argument."

Coins[values : {x__?PositiveIntegerQ}, target_?PositiveIntegerQ] :=
     Sort[Table[Count[coin][#], {coin, values}]& /@ Extract[IntegerPartitions[
          target, Infinity, values], List /@ PositionSmallest[Length /@ IntegerPartitions[
          target, Infinity, values]]]]

Coins[target_?PositiveIntegerQ][values : {x__?PositiveIntegerQ}] :=
     Coins[values, target]

Coins[args___] :=
     Null /; CheckArguments[Coins[args], {1, 2}]

End[]; (* End `Private` *)

EndPackage[];
