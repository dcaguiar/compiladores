lexer grammar EZLexer;


//whitespace
WS : [ \t\n]+ -> skip ;
//comentarios
COMMENT : '{' ~[}]* '}' -> skip;


//Palavras reservadas:
BEGIN       : 'begin' ;
BOOL        : 'bool' ;
ELSE        : 'else' ;
END         : 'end' ;
FALSE       : 'false' ;
IF          : 'if' ;
INT         : 'int' ;
PROGRAM     : 'program' ;
READ        : 'read' ;
REAL        : 'real' ;
REPEAT      : 'repeat' ;
STRING      : 'string' ;
THEN        : 'then' ;
TRUE        : 'true' ;
UNTIL       : 'until' ;
VAR         : 'var' ;
WRITE       : 'write' ;

//Sımbolos especiais:
ASSIGN      : ':=' ;
EQUALS      : '=' ;
LESS        : '<' ;
PLUS        : '+' ;
MINUS       : '-' ;
MULT        : '*' ;
DIV         : '/' ;
L_BRACK     : '(' ;
R_BRACK     : ')' ;
SEMICOLON   : ';' ;

//Constantes numericas e strings
fragment DIGITS : [0-9]+ ;
REAL_VAL        : DIGITS '.' DIGITS ;
INT_VAL         : DIGITS ;
STRINGS         : '"' ~["]* '"' ;

//identificadores
ID : [a-zA-Z]+ ;


fragment UNKNOWN : . ;