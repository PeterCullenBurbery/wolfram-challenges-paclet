BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Composite;

Begin["`Private`"];

(* Define your public and private symbols here. *)

Composite // ClearAll

SetAttributes[Composite, Listable];

Composite::usage = "Composite[n] gives the nth composite number.";

Composite[n_ ? (PositiveIntegerQ[#]&)] :=
    FixedPoint[n + PrimePi[#] + 1&, n]

Composite[args___] :=
    Null /; CheckArguments[Composite[args], {1, 1}]



End[]; (* End `Private` *)

EndPackage[];
