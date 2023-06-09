BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)
PeterBurbery`LittleChildPaclet`MultisetCardinality
Begin["`Private`"];

(* Define your public and private symbols here. *)

MultisetCardinality//ClearAll
expr : MultisetCardinality[a_Association] := 
 Catch[Module[{p}, 
   p = First[
     FirstPosition[Values /@ {a}, 
      v_ /;  ! MatchQ[v, {___Integer?NonNegative}], {Null}, {1}, 
      Heads -> False]]; 
   If[MatchQ[p, _Integer], Message[MultisetCardinality::nocnt, {a}[[p]], p]; 
    Throw[HoldForm[expr]]]; Total[Values[a]]]]
 
expr : MultisetCardinality[a_] := 
 Catch[Module[{p, h}, 
   p = First[FirstPosition[{a}, _?AtomQ, {Null}, {1}, Heads -> False]]; 
   If[MatchQ[p, _Integer], 
    Message[MultisetCardinality::normal, p, HoldForm[expr]]; 
    Throw[HoldForm[expr]]]; h = Head /@ {a}; 
   If[ ! MatchQ[h, {(x_) ...}], 
    p = 1 + First[
       FirstPosition[Rest[h], i_ /; i =!= First[h], {Null}, {1}, 
        Heads -> False]]; 
    Message[MultisetCardinality::heads, First[h], h[[p]], 1, p]; 
    Throw[HoldForm[expr]]]; Length[a]]]
 
expr : MultisetCardinality[a___] := (Message[MultisetCardinality::argx, 
   MultisetCardinality, Length[{a}]]; HoldForm[expr])


End[]; (* End `Private` *)

EndPackage[];