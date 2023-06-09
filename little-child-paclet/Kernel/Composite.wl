BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Composite;

Begin["`Private`"];

(* Define your public and private symbols here. *)

Composite//ClearAll
SetAttributes[Composite, Listable];
Composite[n_?PositiveIntegerQ] := FixedPoint[n + PrimePi[#] + 1 &, n]

End[]; (* End `Private` *)

EndPackage[];