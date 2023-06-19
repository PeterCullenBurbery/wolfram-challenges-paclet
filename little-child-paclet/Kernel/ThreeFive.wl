BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ThreeFive

Begin["`Private`"];

(* Define your public and private symbols here. *)

ThreeFive[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    Quotient[n, 15](*also \[LeftFloor]n/15\[RightFloor] will work.*)

End[]; (* End `Private` *)

EndPackage[];
