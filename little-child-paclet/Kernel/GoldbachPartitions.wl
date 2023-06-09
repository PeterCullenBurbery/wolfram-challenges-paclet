BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`GoldbachPartitions;

Begin["`Private`"];

(* Define your public and private symbols here. *)

GoldbachPartitions // ClearAll

GoldbachPartitions[n_ ? (And @@ {IntegerQ[#], EvenQ[#]}&)] /; n > 2 :=
    Sort /@ IntegerPartitions[n, 2, Table[Prime[m], {m, PrimePi[n]}]]

End[]; (* End `Private` *)

EndPackage[];
