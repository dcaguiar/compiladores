grammar EZLANG;

program: PROGRAM ID SEMI vars-sect stmt-sect

vars-sect: VAR var-decl*

var-decl : type_spec ID SEMI

type-spec: BOOL | INT | REAL | STRING

stmt-sect: BEGIN stmt+ END

stmt: assign-stmt | if-stmt | read-stmt | repeat-stmt | write-stmt

assign-stmt: ID ASSIGN expr SEMI

if-stmt: IF expr THEN stmt+ (ELSE stmt)? END

read-stmt: READ ID SEMI

repeat-stmt: REPEAT stmt+ UNTIL expr

write-stmt: WRITE expr SEMI

expr: expr op expr | LPAR expr RPAR | TRUE | FALSE | INT_VAL | REAL_VAL | STR_VAL | ID

op: TIMES | OVER | PLUS | MINUS | LT | EQ



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