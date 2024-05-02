REM Build script for testbed
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
SET cFilenames=
FOR /R %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

SET assembly=testbed
SET compilerFlags=/Zi 
SET includeFlags=-IC:/engine/engine/src/
SET linkerFlags=/link /libpath:../bin/ engine.lib
SET defines=/DDEBUG /DKIMPORT

ECHO "Building %assembly%%..."
clang-cl %cFilenames% %compilerFlags% /Fe"../bin/%assembly%.exe" %defines% %includeFlags% %linkerFlags%

SET CL_compilerFlags=-g 
SET CL_includeFlags=-IC:\engine\engine\src
SET CL_linkerFlags=-L../bin/ -lengine
SET CL_defines=-DDEBUG -DKIMPORT


REM clang %CL_defines% %CL_includeFlags% %cFilenames% %CL_compilerFlags% -MJ ..\testbed.json -o ../bin/%assembly%.exe %CL_linkerFlags%
