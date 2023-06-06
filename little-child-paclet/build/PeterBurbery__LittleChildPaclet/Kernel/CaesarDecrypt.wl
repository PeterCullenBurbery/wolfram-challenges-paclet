BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`CaesarDecrypt;

Begin["`Private`"];

(* Define your public and private symbols here. *)


ClearAll[caesarrules, CaesarDecrypt]
caesarrules[n_] := caesarrules[n] = Join[
    Thread[
     CharacterRange["a", "z"] -> 
      RotateRight[CharacterRange["a", "z"], n]],
    Thread[
     CharacterRange["A", "Z"] -> 
      RotateRight[CharacterRange["A", "Z"], n]]
    ];
CaesarDecrypt[s_List] := CaesarDecrypt /@ s
CaesarDecrypt[s_String] := CaesarDecrypt[s, 13]
CaesarDecrypt[s_String, n_Integer] := StringReplace[s, caesarrules[n]]
CaesarDecrypt[s_List, n_Integer] := CaesarDecrypt[#, n] & /@ s
CaesarDecrypt[n_Integer][s_String] := CaesarDecrypt[s, n]
CaesarDecrypt[n_Integer][s_List] := CaesarDecrypt[#, n] & /@ s

End[]; (* End `Private` *)

EndPackage[];