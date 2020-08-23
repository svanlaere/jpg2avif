@ECHO OFF
SET args=%*
SET workpath=%~dp0
SET binpath=%workpath%\bin
SET avif=%binpath%\avif.exe
IF NOT DEFINED args GOTO END
PUSHD %args%
ECHO Converting has started (it might take some time)
ECHO.
FOR /R %%A IN (*.jpg) DO (
IF NOT EXIST "%%~pnA.avif" (
    %avif% -e %%~A -o %%~pnA.avif
	ECHO Saved converted file:
	ECHO %%~nA.avif
	ECHO.
  )
)
ECHO Converting has finished
ECHO.
:END
PAUSE