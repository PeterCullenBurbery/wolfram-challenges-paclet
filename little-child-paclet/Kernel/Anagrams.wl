BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`Anagrams;

Begin["`Private`"];

(* Define your public and private symbols here. *)

Anagrams // ClearAll

Anagrams::usage = "Anagrams[str] returns a list of anagrams of str.";

ianagramdictionary = Union[WordData[], DictionaryLookup[], WordList[]
  ];

ianagramdictionary = {#, (Sort @* Characters @* ToLowerCase)[#]}& /@ ianagramdictionary;

Anagrams[str_?StringQ] :=
  Module[{sc = Sort[Characters[ToLowerCase[str]]], sel},
    sel = Select[ianagramdictionary, EqualTo[sc] @* Last][[All, 1]];
    DeleteCases[sel, str]
  ]

Anagrams[args___] :=
  Null /; CheckArguments[Anagrams[args], 1]

End[]; (* End `Private` *)

EndPackage[];
