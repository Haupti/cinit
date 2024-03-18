# Cinit
its a small initialization script for c projects (c11 but can be changed easily).

## how to use
call it with the project name you want.
## what it does
creates
1. a super simple project structured like this:
   /projectname/src/
   /projectname/build/
   /projectname/main.c
   /projectname/makefile
2. the makefile contains:
   * all, run and clean make targets
   * finds all *.c and *.h files withing the project dir and builds/runs the project using clang compiler
   * config section for easy changing

