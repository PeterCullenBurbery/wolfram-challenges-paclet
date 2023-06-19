BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MaximumOverhang;

Begin["`Private`"];

(* Define your public and private symbols here. *)

MaximumOverhang // ClearAll

MaximumOverhang::usage = "MaximumOverhang[n] gives the maximum overhang of a stack of n blocks."

MaximumOverhang[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    HarmonicNumber[n] / 2

End[]; (* End `Private` *)

EndPackage[];
