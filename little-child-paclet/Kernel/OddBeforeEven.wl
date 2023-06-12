BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`OddBeforeEven

Begin["`Private`"];

(* Define your public and private symbols here. *)

OddBeforeEven[list : {__ ? (IntegerQ[#]&)}] :=
    Join[Cases[x_?OddQ][list], Cases[x_?EvenQ][list]]

End[]; (* End `Private` *)

EndPackage[];
