grammar Exec02;

begin: exp;

exp:
	LPAREN exp RPAREN
	| exp (PLUS | MINUS | TIMES | DIV) exp
	| NUM;

WS: [ \t\n]+ -> skip;
PLUS: '+';
MINUS: '-';
TIMES: '*';
DIV: '/';
LPAREN: '(';
RPAREN: ')';
NUM: [0-9]+;