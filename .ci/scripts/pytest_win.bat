@REM No need to alias (check debug.yml output) but leaving it
set python=""
if /i "%1" == "pypy-3.7" (
    set python="pypy3"
) else (
    set python="python"
)
poetry env use %python% --no-ansi
poetry env info --no-ansi
@REM https://github.com/python-poetry/poetry/issues/4163
poetry install -v --no-ansi
set venvp=""
@REM Because of color output batch file will freakout
@REM remove --no-ansi in the for loop and check
@REM https://stackoverflow.com/a/62512174/8608146
for /f "tokens=*" %%A in ('poetry env list --full-path --no-ansi ^| grep Activated ^| cut -d" " -f1') do (
    set "venvp=%%A"
)
set xce=%venvp%\Scripts\activate.bat
@REM Activate venv
call %xce%
where %python%
pytest tests/ --cov=./ --cov-report=xml:coverage/coverage.xml
