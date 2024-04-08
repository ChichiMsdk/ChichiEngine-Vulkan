@ECHO OFF
SetLocal EnableDelayedExpansion

SET cFilenames=
FOR /R %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

ECHO %cFilenames%
