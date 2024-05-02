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
SET compilerFlags=/Zi /DLL /LD
SET includeFlags=-IC:\engine\engine\src -IC:\Lib\glfw\include -IC:\Lib\cglm\include -IC:\VulkanSDK\1.3.275.0\Include
SET linkerFlags=shell32.lib gdi32.lib winmm.lib user32.lib cglm.lib glfw3.lib vulkan-1.lib /libpath:C:\Lib\glfw\lib-vc2022 /libpath:C:\Lib\cglm\win\x64\Release /libpath:C:\VulkanSDK\1.3.275.0\Lib
SET defines=/DDEBUG /DKEXPORT /DCRT_SECURE_NO_WARNINGS

SET CL_includeFlags=-IC:\engine\engine\src -IC:\VulkanSDK\1.3.275.0\Include
SET CL_linkerFlags=-lshell32 -lgdi32 -lwinmm -luser32 -lvulkan-1 -LC:\VulkanSDK\1.3.275.0\Lib
SET CL_defines=-DDEBUG -DKEXPORT -DCRT_SECURE_NO_WARNINGS
SET CL_compilerFlags=-g -shared -Wvarargs -Wall -Werror

ECHO "Building %assembly%%..."

clang-cl %defines% %compilerFlags% %includeFlags% %cFilenames% /Fe"../bin/%assembly%" /link /DLL /OUT:"../bin/%assembly%.dll" %linkerFlags%

REM clang %cFilenames% %CL_compilerFlags% -MJ ..\engine.json -o ../bin/%assembly%.dll %CL_defines% %CL_includeFlags% %CL_linkerFlags%
