lexer grammar Ezlang; 
fragment DIGIT: [0-9];


WS: [ \t\n] -> skip;


// Palavras reservadas
BEGIN: 'begin';
BOOL: 'bool';
ELSE: 'else';
FALSE: 'false';
END: 'end';
IF: 'if';
INT: 'int';
PROGRAM: 'program';
READ: 'read';
REPEAT: 'repeat';
STRING: 'string';
THEN: 'then';
TRUE: 'true';
UNTIL: 'until';
VAR: 'var';
WRITE: 'write';

// Simbolos especiais
ASSIGN: ':=';
EQUAL: '=';
LESS: '<';
PLUS : '+' ;
MINUS : '-' ;
TIMES : '*' ;
OVER : '/' ;
OPEN_P: '(';
CLOSE_P: ')';
SEMICOLON: ';';

// Constantes numéricas e string
INT_VAL: DIGIT+;
REAL_VAL: DIGIT+ '.' DIGIT+;
STR_VAL: '"' ~["]* '"';

// ID da variavel
ID: [a-zA-Z]+;

// Comentario (skipped)
COMMENT: '{' ~[}]* '}' -> skip;
