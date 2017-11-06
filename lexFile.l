alphabetic		[A-Za-z]
digit 			[0-9]
sign			[\-+]
alphanumeric	({alphabetic}|{digit})
%%
int				return(INT);
float			return(FLOAT);
bool			return(BOOL);
void			return(VOID);
char			return(CHAR);
array			return(ARRAY);

false			return(BLN_FALSE);
true			return(BLN_TRUE);

"&&"			return(AND_OPT);
"||"			return(OR_OPT);

if				return(IF);
else			return(ELSE);
switch			return(SWITCH);
case			return(CASE);
default			return(DEFAULT);

while			return(WHILE);
do				return(DO);
break			return(BREAK);
continue		return(CONTINUE);
for				return(FOR);

function		return(FUNCTION);
return			return(RETURN);

"print"			return(PRINT);

"<="			return(LESSEQ_OPT);
">="			return(GREATEREQ_OPT);
"!="			return(NEQ_OPT);
"=="			return(EQ_OPT);
"<"				return(LESS_OPT);
">"				return(GREATER_OPT);

"=*"			return(MULTIPLY_ASSIGNMENT_OPT);
"=/"			return(DIVIDE_ASSIGNMENT_OPT);
"=%"			return(MODE_ASSIGNMENT_OPT);
"=+"			return(ADD_ASSIGNMENT_OPT);
"=-"			return(SUB_ASSIGNMENT_OPT);
"=^"			return(POW_ASSIGNMENT_OPT);
"="				return(ASSIGNMENT_OPT);

"++"			return(INCREMENT_OPT);
"--"			return(DECREMENT_OPT);
"!"				return(NOT_OPT);

"*"				return(MULTIPLY_OPT);
"/"				return(DIVIDE_OPT);
"%"				return(MODE_OPT);
"+"				return(ADD_OPT);
"-"				return(SUB_OPT);
"^"				return(POW_OPT);

{sign}?{digit}+				{sscanf(yytext, "%d", &yylval.integer);
							return(INT_LTRL);
							}
{sign}?{digit}*"."{digit}+	{sscanf(yytext, "%lf", &yylval.real);
							return(FLT_LTRL);
							}
\"(\\.|[^\\"])*\"			{strcpy(yylval.str, yytext);
							return(STR_LTRL);
							}
\'(\\.|[^\\'])+\'			{strcpy(yylval.str, yytext);
							return(CHR_LTRL);
							}
{alphabetic}({alphanumeric}|_)*	{strcpy(yylval.str, yytext);
								return(IDNTF);
								}

";"				return(SEMICOLON);
"{"				return(LEFT_BRACKET);
"}"				return(RIGHT_BRACKET);
","				return(COMMA);
":"				return(COLON);
"("				return(LEFT_PARANTHESIS);
")"				return(RIGHT_PARANTHESIS);
"["				return(LEFT_SQ_BRACKET);
"]"				return(RIGHT_SQ_BRACKET);
(\r|\n|\r\n)	return(NEW_LINE);
[ \t\v\f]+		return(WHITE_SPACE);
.				return(UNKNOWN_CHAR);
%%
