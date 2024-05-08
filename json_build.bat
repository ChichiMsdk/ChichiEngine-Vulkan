@echo off
@echo Building compile_commands.json...
@echo Done.
sed -e "1s/^/[\n/" -e "$s/,$/\n]/" ..\engine.json ..\testbed.json > ..\compile_commands.json
