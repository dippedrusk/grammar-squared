parser grammar GrammarSquaredParser;

options { tokenVocab=GrammarSquaredLexer; }

r_grammar : grammarRule additionalGrammarRules ;
additionalGrammarRules : grammarRule additionalGrammarRules | ;

grammarRule : leftSide Produces rightSideOptions Newline ;

leftSide : Nonterminal ;

rightSideOptions : rightSide additionalRightSideOptions ;
additionalRightSideOptions : Or rightSide additionalRightSideOptions | ;

rightSide : symbol additionalSymbols ;
additionalSymbols : symbol additionalSymbols | ;
symbol : Terminal | Nonterminal ;
