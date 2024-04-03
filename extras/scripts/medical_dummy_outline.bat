@echo off
setlocal enabledelayedexpansion

@REM Loop over all arguments
for %%x in (%*) do (
    SET final_img=%%~nx_s%%~xx
    SET scratch=%%~nx_scratch%%~xx

    copy /Y "%%~x" "!final_img!"
    copy /Y "%%~x" "!scratch!"

@REM Scale up now and scale back down at the end to smooth everything out
@REM Dilate a little to get the edge offset
    magick mogrify -filter spline -resize 200%% ^
        -morphology Dilate Octagon:3 ^
        !scratch!
@REM Dilate a lot to get the edge thickness
    magick mogrify -filter spline -resize 200%% ^
        -morphology Dilate Octagon:8 ^
        !final_img!

@REM Subtract to get just the edge
    magick composite !scratch! !final_img! -compose difference !final_img!

@REM Original picture has alpha values up to 77. Now scale it up to full 255
    magick mogrify -channel A -level 1%%,30%% +channel ^
        -filter Lagrange -resize 50%% ^
        !final_img!

    del !scratch!
)
