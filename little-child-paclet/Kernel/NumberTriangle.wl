BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`NumberTriangle

Begin["`Private`"];

(* Define your public and private symbols here. *)

NumberTriangle[n_ ? (Function[{x}, PositiveIntegerQ[x], {}])] :=
    Column[Array[p |-> Array[#&, p], n]]

End[]; (* End `Private` *)

EndPackage[];
