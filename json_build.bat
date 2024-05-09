@echo off
@echo Building compile_commands.json...
@echo Done.
sed -e "1s/^/[\n/" -e "$s/,$/\n]/" engine\engine.json testbed\testbed.json > compile_commands.json
