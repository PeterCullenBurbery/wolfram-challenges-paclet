(* ::Package:: *)

BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`DigitalRoot;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[DigitalRoot]

DigtalRoot::usage = "DigitalRoot[n] gives the digital root of n. DigitalRoot[n,base] gives the digital root of n in base b."

SetAttributes[DigitalRoot, {Listable}]

DigitalRoot[n_ ? (Function[{x}, NonNegativeIntegerQ[x], {}])] :=
    FixedPoint[Total[IntegerDigits[#]]&, n]

DigitalRoot[n_ ? (Function[{x}, NonNegativeIntegerQ[x], {}]), base_ ?
     (Function[{x}, PositiveIntegerQ[x] && x > 1, {}])] :=
    FixedPoint[Total[IntegerDigits[#, base]]&, n]

DigitalRoot[args___] :=
    Null /; CheckArguments[DigitalRoot[args], 1]

End[]; (* End `Private` *)

EndPackage[];
