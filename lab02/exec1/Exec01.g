grammar Exec01;

begin: exp;

exp: (LPAREN exp RPAREN) | LITERAL;

LITERAL: 'a';
LPAREN: '(';
RPAREN: ')';
WS: [ \t\n]+ -> skip;