BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`FizzBuzz;
Begin["`Private`"];

(* Define your public and private symbols here. *)
FizzBuzz[n_?PositiveIntegerQ]:=Array[Which[Divisible[#,3]&&Divisible[#,5],"fizzbuzz",!Divisible[#,3]&&!Divisible[#,5],#,Divisible[#,3],"fizz",Divisible[#,5],"buzz"]&,n]


End[]; (* End `Private` *)

EndPackage[];