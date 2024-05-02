@ECHO OFF
REM Build Everything
REM sed -e '1s/^/[\n/' -e '$s/,$/\n]/' *.o.json > compile_commands.json

ECHO "Building everything..."


PUSHD engine
CALL build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

PUSHD testbed
CALL build.bat
POPD
IF %ERRORLEVEL% NEQ 0 (echo Error:%ERRORLEVEL% && exit)

ECHO "All assemblies built successfully."
