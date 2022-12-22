dnl Process this file with autoconf to produce a configure script.
AC_INIT(pcalc, 1.5)

#AM_INIT_AUTOMAKE(pcalc, 1.0)
AM_INIT_AUTOMAKE()

dnl Checks for programs.
AC_PROG_YACC
AC_PROG_CC

dnl AC_PROG_LEX
dnl AM_PROG_LEX
AC_PROG_INSTALL

dnl Checks for libraries.
dnl Replace `main' with a function in -ld:
AC_CHECK_LIB(d, main)
dnl Replace `main' with a function in -lm:
AC_CHECK_LIB(m, main)

dnl Checks for header files.
dnl AC_HEADER_STDC
AC_CHECK_HEADERS(malloc.h unistd.h)

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_STRUCT_TM

dnl Checks for library functions.
AC_FUNC_ALLOCA
dnl AC_TYPE_SIGNAL
AC_FUNC_STRFTIME

dnl AC_CONFIG_SUBDIRS([src])

AC_OUTPUT(Makefile)
dnl AC_OUTPUT()

