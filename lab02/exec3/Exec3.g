grammar Exec3;

begin: statement+;

statement: if_stmt | OTHER;

if_stmt:
	IF LPAREN exp RPAREN statement
	| IF LPAREN exp RPAREN statement ELSE statement;

exp: ZERO | ONE;

WS: [ \t\n]+ -> skip;
IF: 'if';
ELSE: 'else';
OTHER: 'other';
LPAREN: '(';
RPAREN: ')';
ZERO: '0';
ONE: '1';