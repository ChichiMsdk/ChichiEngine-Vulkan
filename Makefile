all: engine testbed
	@echo "All assemblies built successfully."

run:
	.\build-all.bat && bin\testbed.exe

engine:
	@echo "Building engine"
	@$(MAKE) -C engine

testbed:
	@echo "Building testbed"
	@$(MAKE) -C testbed

clean:

fclean: clean

re: fclean all

fc: fclean

.PHONY: fclean fc clean all opti engine testbed
