BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`BabbageSquares;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[wordsquare, computewords, BabbageSquares]

wordsquare[s_?StringQ] :=
  Module[{n = StringLength[s], c = {{Characters[s]}}, w, m = 1},
    w = Characters /@ Select[WordList[], StringMatchQ[#, Repeated[_, 
      {n}]]&];
    NestWhile[computewords[w, n, m++, #]&, c, m < n&]
  ]

computewords[w_, n_?IntegerQ, m_?IntegerQ, c_?ListQ] :=
  Flatten[DeleteCases[Map[Cases[w, p : Append[#[[All, m + 1]], Repeated[
    _, {n - m}]] :> Append[#, p]]&, c], {}], 1]

BabbageSquares[word_?StringQ /; StringLength[word] == 4] :=
  Grid /@ wordsquare[word]

End[]; (* End `Private` *)

EndPackage[];
