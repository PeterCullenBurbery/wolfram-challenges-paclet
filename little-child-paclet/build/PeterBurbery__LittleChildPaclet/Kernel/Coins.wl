(* ::Package:: *)

BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Coins;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[Coins]

Coins[values : {x__?PositiveIntegerQ}, target_?PositiveIntegerQ] :=
     Sort[Table[Count[coin][#], {coin, values}]& /@ Extract[IntegerPartitions[
          target, Infinity, values], List /@ PositionSmallest[Length /@ IntegerPartitions[
          target, Infinity, values]]]]

End[]; (* End `Private` *)

EndPackage[];
