pushd ..\addons\
for /D %%i in (*.*) do (
	makepbo -NUP -@=z\addons\ace\%%i %%i ace_%%i.pbo
)
