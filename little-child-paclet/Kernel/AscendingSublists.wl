BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Anagrams;

Begin["`Private`"];

(* Define your public and private symbols here. *)

Anagrams // ClearAll
ianagramdictionary = Union[WordData[], DictionaryLookup[], WordList[]];
ianagramdictionary = {#, (Sort@*Characters@*ToLowerCase)[#]} & /@ 
   ianagramdictionary;
Anagrams[str_String] := 
 Module[{sc = Sort[Characters[ToLowerCase[str]]], sel},
  sel = Select[ianagramdictionary, EqualTo[sc]@*Last][[All, 1]];
  DeleteCases[sel, str]
  ]

End[]; (* End `Private` *)

EndPackage[];