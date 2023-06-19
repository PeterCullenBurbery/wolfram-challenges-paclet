BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`JosephusList;

Begin["`Private`"];

(* Define your public and private symbols here. *)

JosephusList // ClearAll

JosephusList[men_ ? (Function[{x}, PositiveIntegerQ[x], {}]), skip_ ?
    (PositiveIntegerQ[#]&)] :=
   Module[{live = Range[men], next},
      Table[
         next = RotateLeft[live, skip - 1];
         live = Rest[next];
         First[next]
         ,
         {men}
      ]
   ]

End[]; (* End `Private` *)

EndPackage[];
