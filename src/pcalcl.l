%{

/*
** pcalc LEX
**
** Mon 25.Jul.2022 Added yywrap function
*/

#include "ctype.h"
#include "string.h"

#include "hocdecl.h"
#include "symbol.h"
#include "pcalc.h"
#include "convert.h"
#include "help.h"

//define TEST_PARSE
#define RET_EACH

extern  int lineno;
//extern YYSTYPE yylval;

/* default yywrap function - always treat EOF as an EOF */
int yywrap(void) {
    return 1;
}

char    *name;
int     nchar, nword, nline ;
static  int     count(void);

%}

%%

"STORE" |
"store"                         {
                                count();

                                #ifdef RET_EACH
                                return(STORE);
                                #endif
                                }
"RESTORE" |
"restore"                       {
                                count();

                                #ifdef RET_EACH
                                return(RESTORE);
                                #endif
                                }
"TO" |
"to"                            {
                                count();

                                #ifdef RET_EACH
                                return(TO);
                                #endif
                                }

"FROM" |
"from"                          {
                                count();

                                #ifdef RET_EACH
                                return(FROM);
                                #endif
                                }


"OR" |
"or"                            {
                                count();

                                #ifdef RET_EACH
                                return('|');
                                #endif
                                }

"AND" |
"and"                           {
                                count();

                                #ifdef RET_EACH
                                return('&');
                                #endif
                                }

0x[0-9a-fA-F]+[0-9a-fA-F]* {
                                //#ifdef TEST_PARSE
                                if(pgdebug > 1)
                                    printf(" Hexadec: [ %s ]\n", yytext);
                                //#endif

                                yylval.val = (double) hextol(yytext + 2);

                                #ifdef RET_EACH
                                return(NUMBER);
                                #endif
                                }

0y[01]+[01]*                   {
                                //#ifdef TEST_PARSE
                                if(pgdebug > 1)
                                    printf(" Binary:  [ %s ]\n", yytext);
                                //#endif

                                yylval.val = bintol(yytext + 2);

                                #ifdef RET_EACH
                                return(NUMBER);
                                #endif
                                }

0c[0-7]+[0-7]*                 {
                                #ifdef TEST_PARSE
                                printf(" Octal:   [ %s ]\n", yytext);
                                #endif

                                yylval.val = otol(yytext + 2);

                                #ifdef RET_EACH
                                return(NUMBER);
                                #endif
                                }

[0-9]+[0-9]*                   {
                                //#ifdef TEST_PARSE
                                if(pgdebug > 1)
                                    printf(" Decimal: [ %s ]\n", yytext);
                                //#endif

                                yylval.val = (double) atol(yytext);

                                #ifdef RET_EACH
                                return(NUMBER);
                                #endif
                                }

"."[0-9]+ |
[0-9]+"."[0-9]* |
[0-9]+[dDeE][+-]?[0-9]+ |
[0-9]+"."[0-9]*[dDeE][+-]?[0-9]+ |
"."[0-9]+[dDeE][+-]?[0-9]+     {
                                //#ifdef TEST_PARSE
                                if(pgdebug > 1)
                                    printf(" Decimal: [ %s ]\n", yytext);
                                //#endif

                                yylval.val = (double) atof(yytext);

                                #ifdef RET_EACH
                                return(NUMBER);
                                #endif
                                }

\".*\"                          {
                                Symbol *sp;

                                //#ifdef TEST_PARSE
                                if(pgdebug > 1)
                                    printf(" string: [ %s ]\n", yytext);
                                //#endif

                                sp  = lookup_sym(yytext);

                                if(sp)
                                    {
                                    yylval.sym = sp;
                                    return(sp->type);
                                    }
                                else
                                    {
                                    /*
                                     * Kill " "
                                     */
                                    yytext[strlen(yytext) - 1] = '\0';
                                    sp = install_sym(yytext + 1, STR, 0.0);
                                    sp->u.str = sp->name;   //str = strval
                                    yylval.sym = sp;
                                    }

                                #ifdef RET_EACH
                                return(STR);
                                #endif
                                }


\/\/.*                          {
                                //#ifdef TEST_PARSE
                                if(pgdebug > 2)
                                    printf(" Comment: [ %s ]\n", yytext);
                                //#endif

                                #ifdef RET_EACH
                                //return(COMM);
                                #endif
                                }

[a-zA-Z_]+[a-zA-Z0-9_]*         {
                                Symbol *sp;

                                #ifdef TEST_PARSE
                                printf(" Ident:   [ %s ]\n", yytext);
                                #endif

                                sp  = lookup_sym(yytext);

                                if(sp)
                                    {
                                    yylval.sym = sp;

                                    if(sp->type == BUILTIN)
                                        {
                                        //#ifdef TEST_PARSE
                                        if(pgdebug > 1)
                                            printf("Bultin: %s\n", sp->name );
                                        //#endif

                                        #ifdef RET_EACH
                                        return(BUILTIN);
                                        #endif
                                        }
                                    else if(sp->type == IBUILTIN)
                                        {
                                        //#ifdef TEST_PARSE
                                        if(pgdebug > 1)
                                            printf("Bultin: %s\n", sp->name );
                                        //#endif

                                        #ifdef RET_EACH
                                        return(IBUILTIN);
                                        #endif
                                        }
                                    else if(sp->type == VAR)
                                        {
                                        //#ifdef TEST_PARSE
                                        if(pgdebug > 1)
                                            printf("Var: %s\n", sp->name );
                                        //#endif

                                        #ifdef RET_EACH
                                        return(VAR);
                                        #endif
                                        }
                                    }
                                else
                                    {
                                    sp = install_sym(yytext, VAR, 0.0);
                                    yylval.sym = sp;
                                    //yylval.sym->u.val = 0.0;

                                    #ifdef RET_EACH
                                    return(VAR);
                                    #endif
                                    }
                                }

$[a-zA-Z_]+[a-zA-Z0-9_]*       {

                                yylval.sym = lookup_sym(yytext);

                                if(!yylval.sym)
                                    {
                                    yylval.sym =
                                        install_sym(yytext, STRVAR, 0.0);
                                    }

                                #ifdef TEST_PARSE
                                printf(" Stringvar: [ %s ]\n", yytext);
                                #endif

                                #ifdef RET_EACH
                                return(STRVAR);
                                #endif
                                }

[\r]                            {
                                #ifdef TEST_PARSE
                                printf(" Comment: [ %s ]\n", yytext);
                                #endif

                                #ifdef RET_EACH
                                lineno++;
                                //return(COMM);
                                #endif
                                }

[\n]                            {   }

[ \t]+                          {
                                #ifdef TEST_PARSE
                                //printf(" White:   [ %s ]\n", yytext);
                                #endif

                                #ifdef RET_EACH
                                //return(WHITE);
                                #endif
                                }

\".*\"                          {
                                #ifdef TEST_PARSE
                                printf(" String:  [ %s ]\n", yytext);
                                #endif

                                #ifdef RET_EACH
                                //return(STR);
                                #endif
                                }

"<<"                            {
                                #ifdef TEST_PARSE
                                printf(" Shift:  [ %s ]\n", yytext);
                                #endif

                                #ifdef RET_EACH
                                return(LSHIFT);
                                #endif
                                }

">>"                            {
                                #ifdef TEST_PARSE
                                printf(" Shift:  [ %s ]\n", yytext);
                                #endif

                                #ifdef RET_EACH
                                return(RSHIFT);
                                #endif
                                }

"**"                            {
                                #ifdef TEST_PARSE
                                printf(" Power:  [ %s ]\n", yytext);
                                #endif

                                #ifdef RET_EACH
                                return(POWER);
                                #endif
                                }

";"                             {
                                count();

                                #ifdef RET_EACH
                                return(';');
                                #endif
                                }

"{"                             {
                                count();

                                #ifdef RET_EACH
                                return('{');
                                #endif
                                }

"}"                             {
                                count();

                                #ifdef RET_EACH
                                return('}');
                                #endif
                                }

","                             {
                                count();

                                #ifdef RET_EACH
                                return(',');
                                #endif
                                }

":"                             {
                                count();

                                #ifdef RET_EACH
                                return(':');
                                #endif
                                }

"="                             {
                                count();

                                #ifdef RET_EACH
                                return('=');
                                #endif
                                }

"("                             {
                                count();

                                #ifdef RET_EACH
                                return('(');
                                #endif
                                }

")"                             {
                                count();

                                #ifdef RET_EACH
                                return(')');
                                #endif
                                }

"["                             {
                                count();

                                #ifdef RET_EACH
                                return('[');
                                #endif
                                }

"]"                             {
                                count();

                                #ifdef RET_EACH
                                return(']');
                                #endif
                                }

"."                             {
                                count();

                                #ifdef RET_EACH
                                return('.');
                                #endif
                                }

"&"                             {
                                count();

                                #ifdef RET_EACH
                                return('&');
                                #endif
                                }

"!"                             {
                                count();

                                #ifdef RET_EACH
                                return('!');
                                #endif
                                }

"~"                             {
                                count();

                                #ifdef RET_EACH
                                return('~');
                                #endif
                                }

"-"                             {
                                count();

                                #ifdef RET_EACH
                                return('-');
                                #endif
                                }

"+"                             {
                                count();

                                #ifdef RET_EACH
                                return('+');
                                #endif
                                }

"*"                             {
                                count();

                                #ifdef RET_EACH
                                return('*');
                                #endif
                                }

"/"                             {
                                count();

                                #ifdef RET_EACH
                                return('/');
                                #endif
                                }

"%"                             {
                                count();

                                #ifdef RET_EACH
                                return('%');
                                #endif
                                }

"<"                             {
                                count();

                                #ifdef RET_EACH
                                return('<');
                                #endif
                                }

">"                             {
                                count();

                                #ifdef RET_EACH
                                return('>');
                                #endif
                                }

"^"                             {
                                count();

                                #ifdef RET_EACH
                                return('^');
                                #endif
                                }

"|"                             {
                                count();

                                #ifdef RET_EACH
                                return('|');
                                #endif
                                }

"?"                             {
                                count();

                                #ifdef RET_EACH
                                return('?');
                                #endif
                                }

.                              {
                                count();

                                #ifdef RET_EACH
                                //return(yytext[0]);
                                #endif
                               }                    /* ignore all the rest */

%%

int     count(void)

{

}