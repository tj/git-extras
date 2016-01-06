@ECHO OFF
:: don't leak env variables into the calling interperter...
setlocal
:: better defaults for dealing with quotes...
:: You need to escape ! afterwards with ^^! or "^!"
SETLOCAL enabledelayedexpansion

:: A comment on quotes around file path variables:
:: only add quotes around the variable when you use the variable
:: as a file path (exists, type, pipe,...) and teh parenthesis of a 
:: for, not when used as a string (-> setting variables)

:: more does not work if the codepage is set to unicode 65001
for /F "tokens=*" %%F in ('chcp') do (
	for %%A in (%%F) do (set _last=%%A)
)
SET CP=%_last:~0,-1%
chcp 850 > NUL
:: echo %CP%

:: not so sane default...
SET PREFIX=C:\SCM\PortableGit\mingw64

:: find a git.exe in path and use that as a default dir
where /Q git.exe
if errorlevel 1 goto :defaultpath

for /F "delims=" %%F in ('where git.exe') do (
	set bindir=%%~dpF
	rem break after the first, so that we get the first in path
	goto :break
)
goto :defaultpath

:break
rem remove the last slash
SET bindir=%bindir:~0,-1%
for %%G in ("%bindir%") do set installdir=%%~dpG
set PREFIX=%installdir%mingw64
goto :foundprefix

:defaultpath
:: default for Git for Windows 2.x
if exist "%ProgramFiles%\Git" (
    set PREFIX=%ProgramFiles%\Git\mingw64
)

:foundprefix
:: overwrite with whatever the user supplied...
IF NOT "%~1"=="" (
	REM make it easier for the user to specify a prefix:
	REM just supplying the git dir is enough...
	if exist "%~1\mingw64" (
		set PREFIX=%~1\mingw64
	) else (
		echo Using git install path "%~1" as PREFIX, please make sure it's really a
		echo path to the mingw64 directory...
		echo.
		SET PREFIX=%~1
	)
)
:: remove a trailing slash, but only after removing quotes...
set PREFIX=!PREFIX:"=!
IF %PREFIX:~-1%==\ SET PREFIX=%PREFIX:~0,-1%

for %%H in ("%PREFIX%") do set GIT_INSTALL_DIR=%%~dpH

set GIT_INSTALL_DIR=!GIT_INSTALL_DIR:"=!
IF %GIT_INSTALL_DIR:~-1%==\ SET GIT_INSTALL_DIR=%GIT_INSTALL_DIR:~0,-1%

if not exist "%GIT_INSTALL_DIR%\mingw64" (
	echo No mingw64 folder found in %GIT_INSTALL_DIR%. 
	echo.
	echo Please supply a proper "Git for Windows 2.x" install path:
	echo "install.cmd c:\[git-install-path]"
	set ERROR=1
	goto :exit
)

echo Installing to %PREFIX%
SET HTMLDIR=%PREFIX%\share\doc\git-doc
SET GITEXTRAS=%~dp0

IF NOT EXIST "%PREFIX%\bin" MKDIR "%PREFIX%\bin"

SET COMMANDS_WITHOUT_REPO=git-alias git-extras git-fork git-setup

echo Installing binaries...
FOR /R "%GITEXTRAS%\bin" %%i in (*.*) DO (
	ECHO #^^!/usr/bin/env bash > "%PREFIX%\bin\%%~ni"
	TYPE "%GITEXTRAS%\helper\reset-env" >> "%PREFIX%\bin\%%~ni"
	TYPE "%GITEXTRAS%\helper\git-extra-utility" >> "%PREFIX%\bin\%%~ni"
	TYPE "%GITEXTRAS%\helper\is-git-repo" >> "%PREFIX%\bin\%%~ni"
	MORE +2 "%GITEXTRAS%\bin\%%~ni" >> "%PREFIX%\bin\%%~ni"
)

FOR %%i in (%COMMANDS_WITHOUT_REPO%) DO (
	ECHO #^^!/usr/bin/env bash > "%PREFIX%\bin\%%i"
	TYPE "%GITEXTRAS%\helper\reset-env" >> "%PREFIX%\bin\%%i"
	TYPE "%GITEXTRAS%\helper\git-extra-utility" >> "%PREFIX%\bin\%%i"
	MORE +2 "%GITEXTRAS%\bin\%%i" >> "%PREFIX%\bin\%%i"
)

echo Installing man pages...
set _QUIET=/NP /NFL /NDL /NJS /NJH
ROBOCOPY %_QUIET% /IS "%GITEXTRAS%\man" "%HTMLDIR%" *.html
echo done

if not exist "%GIT_INSTALL_DIR%\usr\bin\column.exe" (
	where /Q column.exe
	if errorlevel 1 (
		echo.
		echo column.exe is missing: Not in "%GIT_INSTALL_DIR%\usr\bin" or in PATH!
		echo.
		echo "git summary", "git summary-line" and "git ignore-io" do not work
		echo without. If you need these commands, please install msys2 and 
		echo make column.exe available by copying it into the path or into 
		echo "%GIT_INSTALL_DIR%\usr\bin".
		echo.
	)
)


:exit
@chcp %CP% > NUL
@endlocal enabledelayedexpansion
@endlocal
@exit /b %ERROR%
