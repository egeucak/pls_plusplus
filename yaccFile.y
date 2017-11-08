%token INT FLOAT BOOL VOID CHAR ARRAY FILETYPE DIRTYPE STRING
%token BLN_FALSE BLN_TRUE
%token AND_OPT OR_OPT
%token IF ELSE SWITCH CASE DEFAULT
%token WHILE DO BREAK CONTINUE FOR
%token FUNCTION RETURN
%token BLTIN_PRINT BLTIN_OPEN BLTIN_WRITE BLTIN_DEL BLTIN_COMPARE BLTIN_LISTCONT BLTIN_SORTD BLTIN_GETSIZE BLTIN_GETTYPE BLTIN_CLOSE BLTIN_CONNECT
%token BLTIN_DISCONNECT BLTIN_CHECK BLTIN_SYNC BLTIN_DOWNL BLTIN_UPL
%token LESSEQ_OPT GREATEREQ_OPT NEQ_OPT EQ_OPT LESS_OPT GREATER_OPT 
%token DIVIDE_ASSIGNMENT_OPT ASSIGNMENT_OPT MULTIPLY_ASSIGNMENT_OPT MODE_ASSIGNMENT_OPT ADD_ASSIGNMENT_OPT SUB_ASSIGNMENT_OPT POW_ASSIGNMENT_OPT
%token INCREMENT_OPT DECREMENT_OPT NOT_OPT
%token MULTIPLY_OPT DIVIDE_OPT MODE_OPT ADD_OPT SUB_OPT POW_OPT
%token INT_LTRL FLT_LTRL STR_LTRL CHR_LTRL IDNTF
%token SEMICOLON LEFT_BRACKET RIGHT_BRACKET COMMA COLON LEFT_PARANTHESIS RIGHT_PARANTHESIS LEFT_SQ_BRACKET RIGHT_SQ_BRACKET NEW_LINE WHITE_SPACE UNKNOWN_CHAR
%%
program: function 
		| program function 
		;
function: FUNCTION return_type IDNTF LEFT_PARANTHESIS parameter_list RIGHT_PARANTHESIS block
		;
return_type: data_type		
		;
parameter_list: empty 
		| data_type IDNTF
		| parameter_list COMMA data_type IDNTF
		| VOID
		;
block: LEFT_BRACKET statement_list RIGHT_BRACKET
		| LEFT_BRACKET empty RIGHT_BRACKET
		;
statement_list: statement
		| statement_list statement
		;
statement: assignment SEMICOLON
		| declaration SEMICOLON
		| loop
		| condition
		| function_call SEMICOLON
		| BREAK SEMICOLON
		| CONTINUE SEMICOLON
		| RETURN SEMICOLON
		| RETURN IDNTF SEMICOLON
		| RETURN factor SEMICOLON
		;
declaration: data_type IDNTF 
		| declaration assignment_operator RHS
		| ARRAY data_type IDNTF LEFT_SQ_BRACKET INT_LTRL RIGHT_SQ_BRACKET ASSIGNMENT_OPT LEFT_BRACKET factor_list RIGHT_BRACKET
		;
factor_list: factor
		| factor_list COMMA factor
		;
RHS: arithmetic_expression
		| function_call
		| boolean_expression
		;
function_call: IDNTF LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_PRINT LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_OPEN LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_WRITE LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_DEL LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_COMPARE LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_LISTCONT LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_SORTD LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_GETSIZE LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_GETTYPE LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_CLOSE  LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_CONNECT LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_DISCONNECT LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_CHECK LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_SYNC LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_DOWNL LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		| BLTIN_UPL LEFT_PARANTHESIS identifier_list RIGHT_PARANTHESIS
		;

identifier_list: empty 
		| IDNTF 
		| identifier_list COMMA IDNTF
		| factor
		| identifier_list COMMA factor
		;
arithmetic_expression: term
		| arithmetic_expression ADD_OPT term
		| arithmetic_expression SUB_OPT term
		;
term: factor
		| term MULTIPLY_OPT factor
		| term DIVIDE_OPT factor
		| term POW_OPT factor
		| term MODE_OPT factor
		;
factor: INT_LTRL
		| FLT_LTRL 
		| STR_LTRL
		| CHR_LTRL	
		;
assignment_operator: ASSIGNMENT_OPT 
		| MULTIPLY_ASSIGNMENT_OPT 
		| DIVIDE_ASSIGNMENT_OPT 
		| ADD_ASSIGNMENT_OPT 
		| SUB_ASSIGNMENT_OPT 
		| MODE_ASSIGNMENT_OPT
		| POW_ASSIGNMENT_OPT
		;
assignment: LHS assignment_operator RHS
		| LHS INCREMENT_OPT 
		| LHS DECREMENT_OPT
		;
LHS: IDNTF
		| IDNTF LEFT_SQ_BRACKET INT_LTRL RIGHT_SQ_BRACKET
		;	
loop 	
		: while_loop
		| do_while_loop 
		| for_loop
		;
while_loop: WHILE LEFT_PARANTHESIS boolean_expression RIGHT_PARANTHESIS block 
		;
do_while_loop: do_statement WHILE LEFT_PARANTHESIS boolean_expression RIGHT_PARANTHESIS SEMICOLON
		;
do_statement: DO block
		;
for_loop: FOR LEFT_PARANTHESIS for_statement RIGHT_PARANTHESIS block
		;
for_statement: initialize SEMICOLON boolean_expression SEMICOLON assignment
		;
initialize: declaration
		| assignment
		;
condition: if_statement
		| switch_statement
		;
if_statement: IF LEFT_PARANTHESIS boolean_expression RIGHT_PARANTHESIS block
		| IF LEFT_PARANTHESIS function_call RIGHT_PARANTHESIS block
		| if_statement ELSE IF LEFT_PARANTHESIS boolean_expression RIGHT_PARANTHESIS block
		| if_statement ELSE block
		;
boolean_expression: comparison
		| IDNTF
		| BLN_FALSE 
		| BLN_TRUE
		| NOT_OPT IDNTF
		;
comparison: boolean_expression relational_operators compared
		| boolean_expression boolean_operators compared
		| function_call relational_operators compared
		;
compared: IDNTF
		| BLN_FALSE 
		| BLN_TRUE
		| factor
		;
relational_operators: LESSEQ_OPT
		| GREATEREQ_OPT 
		| NEQ_OPT 
		| EQ_OPT 
		| LESS_OPT 
		| GREATER_OPT
		;
boolean_operators: AND_OPT 
		| OR_OPT 
		;
switch_statement: SWITCH LEFT_PARANTHESIS IDNTF RIGHT_PARANTHESIS LEFT_BRACKET case_statement RIGHT_BRACKET 
		| SWITCH LEFT_PARANTHESIS IDNTF LEFT_SQ_BRACKET IDNTF RIGHT_SQ_BRACKET RIGHT_PARANTHESIS LEFT_BRACKET case_statement RIGHT_BRACKET 
		;
case_statement: CASE IDNTF COLON statement_list
		| CASE factor COLON statement_list
		| case_statement CASE IDNTF COLON statement_list
		| case_statement CASE factor COLON statement_list
	    	| case_statement DEFAULT COLON statement_list
		;
data_type: CHAR 
		| INT 
		| FLOAT 
		| BOOL
		| FILETYPE 
		| DIRTYPE 
		| STRING 
		;
empty: /* empty */
		;
%%


int main(void) {
    //yyparse();
    printf("Syntax is Correct\n");
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "line %d: %s\n", yylineno, s);
}