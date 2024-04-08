NAME 	= ../bin/engine
SRCS = $(shell ..\files.bat)
INCLUDE_FLAGS = -IC:\engine\engine\src -IC:\Lib\glfw\include -IC:\Lib\cglm\include -IC:\VulkanSDK\1.3.275.0\Include
#COMPILER_FLAGS = -g -shared
#LINKER_FLAGS = -LC:\Lib\glfw\lib-vc2022 -LC:\Lib\cglm\win\x64\Release -LC:\VulkanSDK\1.3.275.0\Lib -lshell32 -lgdi32 -lwinmm -luser32 -lcglm -lglfw3 -lvulkan-1 
#DEFINES = -D_DEBUG -D_KEXPORT -D_CRT_SECURE_NO_WARNINGS
COMPILER_FLAGS = /Zi /DLL /LD
LINKER_FLAGS = shell32.lib gdi32.lib winmm.lib user32.lib cglm.lib glfw3.lib vulkan-1.lib /libpath:C:\Lib\glfw\lib-vc2022 /libpath:C:\Lib\cglm\win\x64\Release /libpath:C:\VulkanSDK\1.3.275.0\Lib
DEFINES = /DDEBUG /DKEXPORT /DCRT_SECURE_NO_WARNINGS
#clang -MJcompile_commands.json $(SRCS) $(COMPILER_FLAGS) -o $(NAME).dll $(DEFINES) $(INCLUDE_FLAGS) $(LINKER_FLAGS)

all: $(NAME)

$(NAME):
		clang-cl /clang:-MJcompile_commands.json $(DEFINES) $(COMPILER_FLAGS) $(INCLUDE_FLAGS) $(SRCS) /Fe"$(NAME)" $(LIB_DIR) /link /DLL /OUT:"$(NAME).dll" $(LINKER_FLAGS)

clean:
		rm -rf build/

fclean: clean
		rm -f demineur
		rm -rf demineur.*

re: fclean all

fc: fclean

.PHONY: fclean fc clean all val opti
