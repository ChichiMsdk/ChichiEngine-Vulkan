@ECHO OFF
SetLocal EnableDelayedExpansion

SET "cFilenames="
FOR /R %%f in (*.c) do (
    SET "fullPath=%%f"
    SET "relativePath=!fullPath:*src=src!"
    SET "cFilenames=!cFilenames! !relativePath!"
)

ECHO %cFilenames%
