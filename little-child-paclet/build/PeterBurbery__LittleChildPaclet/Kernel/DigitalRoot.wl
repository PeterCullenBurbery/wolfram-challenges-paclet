(* ::Package:: *)

BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`DigitalRoot;

Begin["`Private`"];

(* Define your public and private symbols here. *)
ClearAll[DigitalRoot]



DigitalRoot[n_?NonNegativeIntegerQ]:=FixedPoint[Total[IntegerDigits[#]] &, n]
End[]; (* End `Private` *)

EndPackage[];
