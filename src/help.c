
/* =====[ help.c ]=========================================================

   Description:  Help file for pcalc

   Revisions:

      REV     DATE     BY           DESCRIPTION
      ----  --------  ----------    --------------------------------------
      0.00  mm/dd/95  Peter Glen    Initial version.

   ======================================================================= */

/* -------- System includes:  -------------------------------------------- */

#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

/* -------- Includes:  --------------------------------------------------- */

int     help_help(void);

/* -------- Strings: ----------------------------------------------------- */

/* -------- Implementation: ---------------------------------------------- */

int     basehelp(void)

{

        printf("\
\n\
Functions:\n\
    SIN   COS   ATAN   LOG    LOG10   EXP   SQRT   INT   ABS\n\
    F2C   C2F   IN2MM  MM2IN  PO2KG   KG2PO\n\
\n\
Operators:\n\
    '+' '-' '*' '/' '^'\n\
\n\
Constants: (case sensitive)\n\
        PI      E     GAMMA   DEG     PHI   \n\
\n\
");
    help_help();
}

int     math_help(void)

{
        printf("\
\n\
Math Functions: (case insensitive)\n\
\n\
    SIN         math sinus              COS        math cos   \n\
    ATAN        math atan               LOG        math log   \n\
    LOG10       math log10              EXP        math exp   \n\
    SQRT        math sqrt               INT        math int   \n\
    ABS         math abs                                      \n\
\n\
");

}

int     funchelp(void)

{
        printf("\
\n\
Functions: (case insensitive)\n\
\n\
    F2C         converting temperature -> fahrenheit to celsius \n\
    C2F         converting temperature -> celsius to fahrenheit \n\
    IN2MM       converting length      -> inches to millimeter \n\
    MM2IN       converting length      -> millimeter to inches\n\
    PO2KG       converting mass        -> pounds to kilogram\n\
    KG2PO       converting mass        -> kilogram to pounds\n\
");
    //help_help();
}

int     ophelp(void)

{
        printf("\
\n\
Operators and priorities:\n\
\n\
    right  assotiation:     '='        ASSIGNMENT\n\
    left   assotiation:     or  and    BINARY OR / BINARY AND\n\
    left   assotiation:     '+' '-'    ADDITION / SUBTRUCTION\n\
    left   assotiation:     '<<' '>>'  SHIFT LEFT / RIGHT (Integer)\n\
    left   assotiation:     '*' '/'    MULTIPLY / DIVIDE\n\
    left   assotiation:     '%%'        MODULUS (Integer)\n\
    left   assotiation:     '-'        UNARY MINUS\n\
    right  assotiation:     '^'        EXPONENTATION\n\
    right  assotiation:     '**'       EXPONENTATION\n\
\n\
");
    help_help();

}

int     conshelp(void)

{
        printf("\
\n\
Constants:\n\
\n\
    PI      3.14159265358979323846\n\
    E       2.71828182845904523536\n\
    GAMMA   0.57721566490153286060\n\
    DEG     57.29577951308322087680\n\
    PHI     1.61803389974989484820\n\
\n\
");
    help_help();
}


int     cbhelp(void)

{
        printf("\
\n\
Controls:\n\
\n\
    date    -  echo string, expanding date (strftime compatible)\n\
    echo    -  echo string.\n\
    _echo   -  echo string without training new line.\n\
    store   -  store variable to file.\n\
    restore -  restore variable from file.\n\
\n\
Built in variables:\n\
\n\
    DEBUG           for printing more debug information\n\
    DECIMAL         controlling number display\n\
                    0 = normal, 1 = DEC 2 = HEX, 3 = BIN\n\
\n\
");
    help_help();
}


int     mainhelp()

{
    printf("Usage: pcalc [options] [argstr [...]]\n");
    printf("\n");
    printf("  Options:      -s silent (minimal output; no hex / bin output)\n");
    printf("                -h help (this screen)\n");
    printf("                -v verbose (more output)\n");
    printf("                -V version\n");
    printf("                -d debug (more than one to raise debug level like -d -d)\n");
    printf("                -f float as decimal (instead of sci. notation)\n");
    printf("\n");
    printf("argsstr:    Items to calculate; (in quotes if necessary [shell expansion])\n");
    printf("argsstr:    Items begin with '@' interpreted as files (ex: @myfile.txt)\n");
    printf("One option per command argument (simple command line implementation)\n");
    printf("\n");
    help_help();
}

int     help_help(void)

{
        printf("\
For functions type pcalc f\n\
For controls  type pcalc l\n\
For operators type pcalc o\n\
For constants type pcalc c\n\
\n\
    Main help: pcalc -h\n\
\n\
");

}


/* EOF */




