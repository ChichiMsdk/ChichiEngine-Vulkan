REM Build script for engine
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.

SET cFilenames=
FOR /R %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

REM echo "Files:" %cFilenames%

SET assembly=engine

SET compilerFlags=/Od /Zi /DLL /LD
SET includeFlags=-IC:\engine\engine\src -IC:\VulkanSDK\1.3.275.0\Include
SET linkerFlags=shell32.lib gdi32.lib winmm.lib user32.lib vulkan-1.lib /libpath:C:\VulkanSDK\1.3.275.0\Lib
SET defines=/D_DEBUG /DKEXPORT /DCRT_SECURE_NO_WARNINGS

REM SET CL_compilerFlags=-g -O0 -shared -Wvarargs -Wall -Wextra -Werror 
SET CL_compilerFlags=-g -O0 -shared -Wvarargs -Wall
SET CL_includeFlags=-IC:\engine\engine\src -IC:\VulkanSDK\1.3.275.0\Include
SET CL_linkerFlags=-lshell32 -lgdi32 -lwinmm -luser32 -lvulkan-1 -LC:\VulkanSDK\1.3.275.0\Lib
SET CL_defines=-D_DEBUG -DKEXPORT -DCRT_SECURE_NO_WARNINGS

ECHO "Building %assembly%%..."

REM clang-cl %defines% %compilerFlags% %includeFlags% %cFilenames% /Fe"../bin/%assembly%" /link /DLL /OUT:"../bin/%assembly%.dll" %linkerFlags%
REM clang-cl %defines% %compilerFlags% %includeFlags% %cFilenames% 
REM /Fe"../bin/%assembly%" /link /DLL /OUT:"../bin/%assembly%.dll" %linkerFlags%

clang %cFilenames% %CL_compilerFlags% -MJ ..\engine.json -o ../bin/%assembly%.dll %CL_defines% %CL_includeFlags% %CL_linkerFlags%
REM clang %cFilenames% %CL_compilerFlags% -MJ ..\engine.json 
REM -o ../bin/%assembly%.dll %CL_defines% %CL_includeFlags% %CL_linkerFlags%
