REM Build script for testbed
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
SET cFilenames=
FOR /R %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

ECHO "Building %assembly%%..."

SET assembly=testbed
SET compilerFlags=/Zi /Od
SET includeFlags=-IC:/engine/engine/src/
SET linkerFlags=/link /libpath:../bin/ engine.lib
SET defines=/D_DEBUG /DKIMPORT

REM clang-cl %cFilenames% %compilerFlags% /Fe"../bin/%assembly%.exe" %defines% %includeFlags% %linkerFlags%
REM clang-cl %cFilenames% %compilerFlags% /Fe"../bin/%assembly%.exe"
REM %defines% %includeFlags% %linkerFlags%

REM SET CL_compilerFlags=-g -O0 -Wvarargs -Wall -Wextra -Werror
SET CL_compilerFlags=-g -O0 -Wvarargs -Wall
SET CL_includeFlags=-IC:/engine/engine/src
SET CL_linkerFlags=-L../bin/ -lengine
SET CL_defines=-D_DEBUG -DKIMPORT

clang %CL_defines% %CL_includeFlags% %cFilenames% %CL_compilerFlags% -MJ ..\testbed.json -o ../bin/%assembly%.exe %CL_linkerFlags%

REM clang %CL_defines% %CL_includeFlags% %cFilenames%
REM %CL_compilerFlags% -MJ ..\testbed.json -o ../bin/%assembly%.exe %CL_linkerFlags%
