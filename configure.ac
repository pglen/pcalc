dnl Process this file with autoconf to produce a configure script.
AC_INIT([pcalc],[1.3])

#AM_INIT_AUTOMAKE(pcalc, 1.0)
AM_INIT_AUTOMAKE()

dnl Checks for programs.
AC_PROG_YACC
AC_PROG_CC

dnl AC_PROG_LEX
AM_PROG_LEX
AC_PROG_INSTALL

dnl Checks for libraries.
dnl Replace `main' with a function in -ld:
AC_CHECK_LIB(d, main)
dnl Replace `main' with a function in -lm:
AC_CHECK_LIB(m, main)

dnl Checks for header files.
m4_warn([obsolete],
[The preprocessor macro `STDC_HEADERS' is obsolete.
  Except in unusual embedded environments, you can safely include all
  ISO C90 headers unconditionally.])dnl
# Autoupdate added the next two lines to ensure that your configure
# script's behavior did not change.  They are probably safe to remove.
AC_CHECK_INCLUDES_DEFAULT
AC_PROG_EGREP

AC_CHECK_HEADERS(malloc.h unistd.h)

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_STRUCT_TM

dnl Checks for library functions.
AC_FUNC_ALLOCA
m4_warn([obsolete],
[your code may safely assume C89 semantics that RETSIGTYPE is void.
Remove this warning and the `AC_CACHE_CHECK' when you adjust the code.])dnl
AC_CACHE_CHECK([return type of signal handlers],[ac_cv_type_signal],[AC_COMPILE_IFELSE(
[AC_LANG_PROGRAM([#include <sys/types.h>
#include <signal.h>
],
		 [return *(signal (0, 0)) (0) == 1;])],
		   [ac_cv_type_signal=int],
		   [ac_cv_type_signal=void])])
AC_DEFINE_UNQUOTED([RETSIGTYPE],[$ac_cv_type_signal],[Define as the return type of signal handlers
		    (`int' or `void').])

AC_FUNC_STRFTIME

AC_CONFIG_FILES([Makefile])
AC_OUTPUT













