pushd ..\addons\
del /q /f *.pbo
for /D %%i in (*.*) do (
	makepbo -NUP -@=z\addons\ace\%%i %%i ace_%%i.pbo
	if %errorlevel% neq 0 exit /b %errorlevel%
)
popd
