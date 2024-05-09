#NAME 	= ../bin/engine

ASSEMBLY = testbed
JSON_FILE = temp.json
EXTENSION = .exe
DIR = $(subst /,\,${CURDIR})
BUILD_DIR = ..\bin
OBJ_DIR = ..\obj\testbed
INCLUDE_FL = -Isrc -I..\engine\src
SRC_FILES = $(shell ..\files2.bat)
DIRECTORIES = $(subst $(DIR),,$(shell dir src /S /AD /B | findstr /i src))
OBJ_FILES = $(SRC_FILES:%=$(OBJ_DIR)/%.o)

#clang
CLANG_COMPILER_FLAGS = -g -O0 -Wall -fdeclspec -MJ $(JSON_FILE)
CLANG_LINKER_FLAGS = -g -lengine.lib -L$(BUILD_DIR)
CLANG_DEFINES = -D_DEBUG -DKIMPORT
CLANG_DLL = -o $(NAME).exe
CLANG_NAME = -o $(NAME)

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
	-@setlocal enableextensions enabledelayedexpansion && mkdir $(OBJ_DIR)\src 2>nul || cd .
	@echo Created $(OBJ_DIR) folders

$(BUILD_DIR):
	-@setlocal enableextensions enabledelayedexpansion && mkdir $(BUILD_DIR) 2>nul || cd .
	@echo Created bin folder

$(BUILD_DIR)/$(ASSEMBLY)$(EXTENSION): $(OBJ_FILES) 
	@$(CC) $(OBJ_FILES) -o $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) $(LINKER_FL)
	@echo Linked $(ASSEMBLY)$(EXTENSION) in $(BUILD_DIR)\!
	@if exist $(JSON_FILE) del $(JSON_FILE)

clean:
	@if exist $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) del $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION) && @echo deleted $(BUILD_DIR)\$(ASSEMBLY)$(EXTENSION)
	@if exist $(BUILD_DIR)\$(ASSEMBLY).lib del $(BUILD_DIR)\$(ASSEMBLY).lib && @echo deleted $(BUILD_DIR)\$(ASSEMBLY).lib
	@if exist $(BUILD_DIR)\$(ASSEMBLY).ilk del $(BUILD_DIR)\$(ASSEMBLY).ilk && @echo deleted $(BUILD_DIR)\$(ASSEMBLY).ilk
	@if exist $(BUILD_DIR)\$(ASSEMBLY).pdb del $(BUILD_DIR)\$(ASSEMBLY).pdb && @echo deleted $(BUILD_DIR)\$(ASSEMBLY).pdb
	@if exist $(BUILD_DIR)\$(ASSEMBLY).exp del $(BUILD_DIR)\$(ASSEMBLY).exp && @echo deleted $(BUILD_DIR)\$(ASSEMBLY).exp

fclean: clean
	@if exist $(OBJ_DIR) rmdir /s /q $(OBJ_DIR) && @echo deleted folder $(OBJ_DIR)
	@if exist testbed.json del testbed.json

fc: fclean

re: fclean all

$(OBJ_DIR)/%.c.o: %.c
	@echo $<...
	@$(CC) $(COMPILE_FL) $(DEFINES) $(INCLUDE_FL) $< -c -o $@
	@if exist $(JSON_FILE) @cat $(JSON_FILE) >> testbed.json

.PHONY: all clean re fclean fc
