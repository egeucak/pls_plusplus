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
file			return(FILE);
dir				return(DIR);
cloud			return(CLOUD);
string			return(STRING);

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

"pls_print"			return(BLTIN_PRINT);
"pls_open"			return(BLTIN_OPEN);
"pls_write"			return(BLTIN_WRITE);
"pls_delete"		return(BLTIN_DEL);
"pls_compare"		return(BLTIN_COMPARE);
"pls_listContents"	return(BLTIN_LISTCONT);
"pls_sortDir"		return(BLTIN_SORTD);
"pls_getSize"		return(BLTIN_GETSIZE);
"pls_getType"		return(BLTIN_GETTYPE);
"pls_close"			return(BLTIN_CLOSE);
"pls_connect"		return(BLTIN_CONNECT);
"pls_disconnect"	return(BLTIN_DISCONNECT);
"pls_check"			return(BLTIN_CHECK);
"pls_synchronize"	return(BLTIN_SYNC);
"pls_download"		return(BLTIN_DOWNL);
"pls_upload"		return(BLTIN_UPL);

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

{sign}?{digit}+				return(INT_LTRL);
{sign}?{digit}*"."{digit}+	return(FLT_LTRL);
\"(\\.|[^\\"])*\"			return(STR_LTRL);
\'(\\.|[^\\'])+\'			return(CHR_LTRL);
{alphabetic}({alphanumeric}|_)*	return(IDNTF);

";"				return(SEMICOLON);
"{"				return(LEFT_BRACKET);
"}"				return(RIGHT_BRACKET);
","				return(COMMA);
":"				return(COLON);
"("				return(LEFT_PARANTHESIS);
")"				return(RIGHT_PARANTHESIS);
"["				return(LEFT_SQ_BRACKET);
"]"				return(RIGHT_SQ_BRACKET);
(\r|\n|\r\n)	{extern int lineno;
				alalineno++;
				return(NEW_LINE);
				}
[ \t\v\f]+		;
.				return(UNKNOWN_CHAR);
%%
