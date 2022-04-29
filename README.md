#                Programmer's Calculator

##  Arithmetic in base 16, base 10, base 2 (hex, dec, bin)

 Resurrected this because it may be useful. For instance, in embedded programming it
 is nice to see results from mixed operations from stuff like '0xf800+27'.

 For some, it may  serve as a good introduction to LEX/YACC.

 Came to learn, that this code was used in several commercial products, which
I welcome with open arms, even if no credit was given. Glad I could make an impact.

  I got to find out that one of the products - based upon this code - is successful
enough to maintain a nice farm. Would be ice to have a side/guest house there to visit.

## Tech:

      Operators. Precedence like in 'C'

 Operator summary:

        right  assotiation:     '='         ASSIGNMENT\n\
        left   assotiation:     or  and     BINARY OR/BINARY AND\n\
        left   assotiation:     '+' '-'     ADDITION/SUBTRUCTION\n\
        left   assotiation:     '*' '/' '%' MULTIPLY/DIVIDE/MODULUS\n\
        left   assotiation:     '-'         UNARY MINUS\n\
        right  assotiation:     '^'         EXPONENTATION\n\

 Math functions summary:

        SIN         math sinus              COS        math cos
        ATAN        math atan               LOG        math log
        LOG10       math log10              EXP        math exp
        SQRT        math sqrt               INT        math int
        ABS         math abs

 Function summary:

        F2C         converting temperature -> fahrenheit to celsius
        C2F         converting temperature -> celsius to fahrenheit
        IN2MM       converting length      -> inches to millimeter
        MM2IN       converting length      -> millimeter to inches
        PO2KG       converting mass        -> pounds to kilogram
        KG2PO       converting mass        -> kilogram to pounds

 Constans summary:

        PI      3.14159265358979323846
        E       2.71828182845904523536
        GAMMA   0.57721566490153286060
        DEG     57.29577951308322087680
        PHI     1.61803389974989484820

Type pcalc with no arguments for help summary.

See the file INSTALL for building and installation instructions.
(the usual configure / make )

pcalc is free software.

## Command line usage summary

 The command line parser pre-parses the strings you pass on. If the
command line is not delivering to pcalc what you expect, you may
enclose the command in quotes; For instance the string 2 / 3 is
parsed into three arguments, so using "2 / 3" delivers what you
intended. The string 2/3 is interpreted as you intended.

Peter Glen





