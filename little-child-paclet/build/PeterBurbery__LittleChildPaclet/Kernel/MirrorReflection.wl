BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ButterflyString;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ButterflyString[input_?StringQ] :=
    StringJoin[input, StringReverse[input]]

End[]; (* End `Private` *)

EndPackage[];
