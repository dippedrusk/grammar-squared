lexer grammar GrammarSquaredLexer;

NonTerminal : CapitalAlpha AlphaNum* ;
Terminal : QuoteChar Char* QuoteChar ;

Produces : '->' ;
Or : '|' ;

fragment CapitalAlpha : [A-Z] ;
fragment AlphaNum : Alpha | Digit ;
fragment Alpha : [a-zA-Z] ;
fragment Digit : [0-9] ;

fragment Char : ~('"') ;
fragment QuoteChar : '"' ;

// skip spaces and tabs
WS : [ \t\r]+ -> skip ;
