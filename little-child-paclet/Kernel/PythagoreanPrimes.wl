BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`ButterflyString;

Begin["`Private`"];

(* Define your public and private symbols here. *)

PythagoreanPrimes[n_] :=
    Select[PrimeQ] @* Select[Mod[#, 4] == 1&] @ Range @ (n)

End[]; (* End `Private` *)

EndPackage[];
