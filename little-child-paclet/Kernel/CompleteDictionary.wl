(* ::Package:: *)


     (* ::Package:: *)

BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBIurbery`LittleChildPaclet`CompleteDictionary;

Begin["`Private`"];

(* Define your public and private symbols here. *)
ClearAll[CompleteDictionary]
CompleteDictionary[]:=Union[WordData[], DictionaryLookup[], WordList[]]
CompleteDictionary[s_?StringPatternQ]:=Select[StringMatchQ[s][#]&][CompleteDictionary[]]
End[]; (* End `Private` *)

EndPackage[];
