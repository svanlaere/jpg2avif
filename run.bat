@ECHO OFF
SET args=%*
SET workpath=%~dp0
SET binpath=%workpath%\bin
SET avif=%binpath%\avif.exe
IF NOT DEFINED args GOTO END
PUSHD %args%
IF NOT EXIST *.jpg GOTO NOJPG
RENAME *.JPG *.jpg
ECHO Converting has started (it might take some time)
ECHO.
FOR /R %%A IN (*.jpg) DO (
IF NOT EXIST "%%~pnA.avif" (
    %avif% -e %%~A -o %%~pnA.avif
    ECHO Saved converted file:
    ECHO.
  ) else (
    ECHO File exists:
    ECHO %%~nA.avif
    ECHO.	
  )
)
ECHO Converting has finished
ECHO.
PAUSE
EXIT
:END
ECHO Converting failed: no arguments
ECHO.
PAUSE
EXIT
:NOJPG
ECHO Converting failed: no JPG found
ECHO.
PAUSE
EXIT