BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`LargestContiguousSum;

Begin["`Private`"];

(* Define your public and private symbols here. *)

LargestContiguousSum//ClearAll
LargestContiguousSum[numbers_?VectorQ] := 
 Total[First[MaximalBy[Total][Subsequences[numbers]]]]

End[]; (* End `Private` *)

EndPackage[];