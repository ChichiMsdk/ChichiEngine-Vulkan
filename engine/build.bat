REM Build script for engine
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .c files.
REM

SET cFilenames=
FOR /R %%f in (*.c) do (
    SET cFilenames=!cFilenames! %%f
)

REM echo "Files:" %cFilenames%

SET assembly=engine
SET compilerFlags=/Zi /DLL /LD
SET includeFlags=-I.\src -IC:\Lib\glfw\include -IC:\Lib\cglm\include -IC:\VulkanSDK\1.3.275.0\Include
SET linkerFlags=shell32.lib gdi32.lib winmm.lib user32.lib cglm.lib glfw3.lib vulkan-1.lib /libpath:C:\Lib\glfw\lib-vc2022 /libpath:C:\Lib\cglm\win\x64\Release /libpath:C:\VulkanSDK\1.3.275.0\Lib
SET defines=/DDEBUG /DKEXPORT /DCRT_SECURE_NO_WARNINGS

ECHO "Building %assembly%%..."
clang-cl %defines% %compilerFlags% %includeFlags% %cFilenames% /Fe"../bin/%assembly%" /link /DLL /OUT:"../bin/%assembly%.dll" %linkerFlags%
















REM clang %cFilenames% %compilerFlags% -MJ -fdriver-only -o ../bin/%assembly%.dll %defines% %includeFlags% %linkerFlags%
