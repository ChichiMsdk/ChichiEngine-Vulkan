#NAME 	= ../bin/engine

ASSEMBLY = engine
EXTENSION = .dll
DIR = $(subst /,\,${CURDIR})
BUILD_DIR = ..\bin
OBJ_DIR = ..\obj\engine
INCLUDE_FL = -Isrc -IC:\VulkanSDK\1.3.275.0\Include
SRC_FILES = $(shell ..\files2.bat)
DIRECTORIES = $(subst $(DIR),,$(shell dir src /S /AD /B | findstr /i src))
OBJ_FILES = $(SRC_FILES:%=$(OBJ_DIR)/%.o)

#clang
CLANG_COMPILER_FLAGS = -g -O0 -Wvarargs -Wall -fdeclspec -MJ ..\engine.json
CLANG_LINKER_FLAGS = -shared -LC:\VulkanSDK\1.3.275.0\Lib -L$(OBJ_DIR) -lshell32 -lgdi32 -lwinmm -luser32 -lvulkan-1 
CLANG_DEFINES = -D_DEBUG -DKEXPORT -D_CRT_SECURE_NO_WARNINGS
CLANG_DLL = -o $(NAME).dll
CLANG_NAME = -o $(NAME)

#msvc
MSVC_COMPILER_FLAGS = /clang:-MJ..\engine.json /Zi /DLL /LD
MSVC_LINKER_FLAGS = shell32.lib gdi32.lib winmm.lib user32.lib vulkan-1.lib /libpath:C:\VulkanSDK\1.3.275.0\Lib
MSVC_DEFINES = /D_DEBUG /DKEXPORT /DCRT_SECURE_NO_WARNINGS
MSVC_DLL = /link /DLL /OUT:"$(NAME).dll"
MSVC_NAME = /Fe"$(NAME)"

#will be used
CC = clang
DEFINES = $(CLANG_DEFINES)
LINKER_FL = $(CLANG_LINKER_FLAGS)
COMPILE_FL = $(CLANG_COMPILER_FLAGS)
DLL = $(CLANG_DLL)
OUT_NAME = $(CLANG_NAME)

all: scaffolding $(BUILD_DIR)/$(ASSEMBLY)$(EXTENSION)

scaffolding: $(BUILD_DIR) $(OBJ_DIR)

$(OBJ_DIR):
	-@setlocal enableextensions enabledelayedexpansion && mkdir $(addprefix $(OBJ_DIR), $(DIRECTORIES)) 2>nul || cd .
	@echo Created obj folders

$(BUILD_DIR):
	-@setlocal enableextensions enabledelayedexpansion && mkdir $(BUILD_DIR) 2>nul || cd .
	@echo Created bin folder

$(BUILD_DIR)/$(ASSEMBLY)$(EXTENSION): $(OBJ_FILES) 
	@$(CC) $(OBJ_FILES) -o $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) $(LINKER_FL)
	@echo Linked $(ASSEMBLY)$(EXTENSION) in $(BUILD_DIR)\!

clean:
	@if exist $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) del $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION)
	@if exist $(BUILD_DIR)\$(ASSEMBLY).ilk del $(BUILD_DIR)\$(ASSEMBLY).ilk
	@if exist $(BUILD_DIR)\$(ASSEMBLY).pdb del $(BUILD_DIR)\$(ASSEMBLY).pdb
	@if exist $(BUILD_DIR)\$(ASSEMBLY).lib del $(BUILD_DIR)\$(ASSEMBLY).lib 
	@if exist $(BUILD_DIR)\$(ASSEMBLY).exp del $(BUILD_DIR)\$(ASSEMBLY).exp 

fclean:
	@if exist $(OBJ_DIR) rmdir /s /q $(OBJ_DIR)

fc: fclean

re: fclean all

$(OBJ_DIR)/%.c.o: %.c
	@echo $<...
	@$(CC) $(COMPILE_FL) $(DEFINES) $(INCLUDE_FL) $< -c -o $@

.PHONY: all clean re fclean fc
