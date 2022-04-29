##                Programmer's Calculator

# Command line conversion and arithmetic in base 16, base 10, base 2 (hex, dec, bin)

 Resurrected this because it may be useful, and it can serve as a good introduction
to LEX/YACC.

 Came to learn, that this code was used in several commercial products, which
I welcome with open arms, even if no credit was given. Glad I could make
an impact.

 Tech:

   Operator precedence like in 'C'

 Operator summary:

    right  assotiation:     '='        ASSIGNMENT\n\
    left   assotiation:     or  and    BINARY OR/BINARY AND\n\
    left   assotiation:     '+' '-'    ADDITION/SUBTRUCTION\n\
    left   assotiation:     '*' '/'    MULTIPLY/DIVIDE\n\
    left   assotiation:     '-'        UNARY MINUS\n\
    right  assotiation:     '^'        EXPONENTATION\n\

 Function summary:

    SIN         math sinus              COS        math cos
    ATAN        math atan               LOG        math log
    LOG10       math log10              EXP        math exp
    SQRT        math sqrt               INT        math int
    ABS         math abs

    F2C         converting temperature -> fahrenheit to celsius
    C2F         converting temperature -> celsius to fahrenheit
    IN2MM       converting length      -> inches to millimeter
    MM2IN       converting length      -> millimeter to inches
    PO2KG       converting mass        -> pounds to kilogram
    KG2PO       converting mass        -> kilogram to pounds

Type pcalc with no arguments for help.

See the file INSTALL for building and installation instructions.
(the usual configure / make )

pcalc is free software.

Peter Glen





