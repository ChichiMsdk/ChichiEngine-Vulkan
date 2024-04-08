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
