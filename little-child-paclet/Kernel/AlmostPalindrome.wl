BeginPackage["PeterBurbery`LittleChildPaclet`"];

(* Declare your packages public symbols here. *)

PeterBurbery`LittleChildPaclet`AlmostPalindrome;

Begin["`Private`"];

(* Define your public and private symbols here. *)

AlmostPalindrome // ClearAll

AlmostPalindrome::usage = "AlmostPalindrome[n] returns a list of words of length n that are not palindromes, but become palindromes when any one letter is removed.";

AlmostPalindrome[n_ ? (PositiveIntegerQ[#]&)] :=
  Cases[word_ /; !PalindromeQ[word] && (CountsBy[PalindromeQ][StringDrop[
    word, {#}]& /@ Range[n]][True] >= 1)][DictionaryLookup[StringExpression
     @@ ConstantArray[Blank[], n]]]

AlmostPalindrome[args___] :=
  Null /; CheckArguments[AlmostPalindrome[args], 1]

End[]; (* End `Private` *)

EndPackage[];
