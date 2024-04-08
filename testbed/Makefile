NAME 	= ../bin/testbed
SRCS = $(shell ..\files.bat)
#COMPILER_FLAGS = -g
#LINKER_FLAGS = -L../bin -lengine
#DEFINES = -DDEBUG -DKIMPORT

INCLUDE_FLAGS = -IC:\engine\engine\src -IC:\Lib\glfw\include -IC:\Lib\cglm\include -IC:\VulkanSDK\1.3.275.0\Include
COMPILER_FLAGS = /Zi
LINKER_FLAGS = /link /libpath:../bin/ engine.lib
DEFINES = /DDEBUG /DKIMPORT
#clang -MJ"$(SRCS)" $(COMPILER_FLAGS) -o $(NAME) $(DEFINES) $(INCLUDE_FLAGS) $(LINKER_FLAGS)

all: $(NAME)

$(NAME):
	clang-cl /clang:-MJcompile_commands.json $(SRCS) $(COMPILER_FLAGS) /Fe"$(NAME)" $(DEFINES) $(INCLUDE_FLAGS) $(LINKER_FLAGS)

clean:

fclean: clean

re: fclean all

fc: fclean

.PHONY: fclean fc clean all opti
