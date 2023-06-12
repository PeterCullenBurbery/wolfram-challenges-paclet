BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`IntegerPalindromeQ;

Begin["`Private`"];

(* Define your public and private symbols here. *)

IntegerPalindromeQ[n_?IntegerQ] :=
    IntegerReverse[n] == n

IntegerPalindromeQ[n_?IntegerQ, b_] /; b > 1 :=
    IntegerReverse[n, b] == n

End[]; (* End `Private` *)

EndPackage[];
