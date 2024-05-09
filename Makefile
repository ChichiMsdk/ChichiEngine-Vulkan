all: testbed
	@echo "All assemblies built successfully."

run: testbed
	bin\testbed.exe
#	.\build-all.bat && bin\testbed.exe

json: re
	.\json_build.bat

engine:
	@echo "Building engine"
	@$(MAKE) --no-print-directory -C engine

testbed: engine
	@echo "Building testbed"
	@$(MAKE) --no-print-directory -C testbed

clean:
	@make --no-print-directory -C testbed clean
	@make --no-print-directory -C engine clean

fclean: clean
	@make --no-print-directory -C testbed fclean
	@make --no-print-directory -C engine fclean

re: fclean all

fc: fclean

.PHONY: fclean fc clean all opti engine testbed
