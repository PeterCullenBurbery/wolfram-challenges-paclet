BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`MultisetComplement;

Begin["`Private`"];

(* Define your public and private symbols here. *)
MultisetComplement//ClearAll

expr : MultisetComplement[a__Association] := 
 Catch[Module[{p}, 
   p = First[
     FirstPosition[Values /@ {a}, 
      v_ /;  ! MatchQ[v, {___Integer?NonNegative}], {Null}, {1}, 
      Heads -> False]]; 
   If[MatchQ[p, _Integer], 
    Message[MultisetComplement::nocnt, p, HoldForm[expr]]; 
    Throw[HoldForm[expr]]]; msetComplement[{a}]]]
expr : MultisetComplement[a__] := 
 Catch[Module[{p, h, counts}, 
   p = First[
     FirstPosition[{a}, _?AtomQ, {Null}, {1}, Heads -> False]]; 
   If[MatchQ[p, _Integer], 
    Message[MultisetComplement::normal, p, HoldForm[expr]]; 
    Throw[HoldForm[expr]]]; h = Head /@ {a}; 
   If[ ! MatchQ[h, {(x_) ...}], 
    p = 1 + First[
       FirstPosition[Rest[h], i_ /; i =!= First[h], {Null}, {1}, 
        Heads -> False]]; 
    Message[MultisetComplement::heads, First[h], h[[p]], 1, p]; 
    Throw[HoldForm[expr]]]; 
   counts = msetComplement[Counts /@ Apply[List, {a}, {1}]]; 
   countsToBag[counts, {a}, h]]]
expr : MultisetComplement[] := (Message[MultisetComplement::argm, 
   MultisetComplement, 0, 1]; HoldForm[expr])

   msetComplement[
  a : {__Association}] := (KeySort[DeleteCases[#1, 0]] & )[
  Merge[KeyUnion[{First[a], msetSum[Rest[a]]}, 0 & ], 
   Ramp[Subtract @@ #1] & ]]

   msetSum[a : {___Association}] := 
 With[{counts = KeyUnion[a, 0 & ]}, (KeySort[DeleteCases[#1, 0]] & )[
   Merge[counts, Total]]]

   countsToBag[counts_, a_, 
  h_] := (Switch[a, {__}, First[h] @@ #1, _, #1] & )[
  Join @@ KeyValueMap[ConstantArray, counts]]
End[]; (* End `Private` *)

EndPackage[];