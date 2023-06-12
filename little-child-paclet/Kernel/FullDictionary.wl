(* ::Package:: *)

(* ::Package:: *)

BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`FullDictionary;

Begin["`Private`"];

(* Define your public and private symbols here. *)

ClearAll[FullDictionary]

FullDictionary[] =
     Union[WordData[], DictionaryLookup[], WordList[]];

FullDictionary[s_?StringPatternQ] :=
     Select[StringMatchQ[s][#]&][FullDictionary[]]

End[]; (* End `Private` *)

EndPackage[];
