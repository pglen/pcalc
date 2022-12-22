
/* =====[ help.h ]=========================================================

   Description:

   Notes:   To use it there are two metods: as definition   (EXPORT)
                                            as prototyping. (IMPORT)

            If EXPORT is defined, we define and initialize variables,
            otherwise we supply prototypes.

            If we want to initialize, it is done like:

            int this variable
            #ifdef EXPORT
            = FALSE
            #endif
            ;               !!!!  note the semicolon !!!!

            EXPORT is undefined by this process, for the next include file
            it should be stated again.


      REV     DATE     BY           DESCRIPTION
      ----  --------  ----------    --------------------------------------
      0.00  mm/dd/95  Peter Glen    Initial version.

   ======================================================================= */

#ifndef help_defined
#define help_defined

#ifdef  EXPORT
#define EXTERN
#else
#define EXTERN extern
#endif

/* -------- Defines: ----------------------------------------------------- */


/* -------- Protos ------------------------------------------------------- */

int     basehelp(void);
int     math_help(void);
int     funchelp(void);
int     ophelp(void);
int     conshelp(void);
int     cbhelp(void);
int     help_help(void);
int     mainhelp();

extern  int     pgdebug;
extern  int     verbose;
extern  int     gl_float;


#undef  EXTERN
#undef  EXPORT

#endif

/* EOF */
