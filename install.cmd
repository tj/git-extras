@ECHO OFF
SETLOCAL
REM -- Set Current Directory as GITEXTRAS
SET GITEXTRAS=%~dp0

:MAINPROGRAM
	:STARTPOINT
	CALL :CLEARVARIABLES
	CALL :OPTION
	IF %INSTALLWAY%==1 (
		GOTO UACPROMT
		:ENDUACPROMT
		CALL :GETPATHFROMREG
		IF '%INSTALLPATH%' == '' (
			ECHO.It seems GitForWindows does not install in the standard way.
			GOTO STARTPOINT
		)
	) ELSE IF %INSTALLWAY%==2 (
		ECHO.Please Enter the Path Where GitForWindows installs:
		SET /p INSTALLPATH=
		ECHO.
	) ELSE IF %INSTALLWAY%==0 (
		GOTO ENDPOINT
	) ELSE (
		ECHO.It seems you enter invalid things.
		ECHO.Please enter again.
		GOTO STARTPOINT
	)

	REM -- Make sure Installation Path contains git.exe
	IF not exist %INSTALLPATH%\cmd\git.exe (
		ECHO.The Installation Path does not contain git.exe!
		GOTO STARTPOINT
	) ELSE (
		SET PREFIX=%INSTALLPATH%\mingw64
		SET HTMLDIR=%PREFIX%\share\doc\git-doc
		IF NOT EXIST %PREFIX%\etc\bash_completion.d MKDIR %PREFIX%\etc\bash_completion.d
		SET BASHCOMPLETION=%PREFIX%\etc\bash_completion.d
	)

	REM -- Just Copy and Paste
	CALL :JUSTCOPY

	ECHO.
	ECHO.Git Extras has been successfully installed.
	ECHO.Enjoy it!
GOTO ENDPOINT

:OPTION
	ECHO.The way you install GitForWindows:
	ECHO.1) Standard installer
	ECHO.2) Portable 7-zip file
	ECHO.0) Exit
	SET /p INSTALLWAY="Enter the Option number: "
	ECHO.
GOTO :EOF

:UACPROMT
	REM -- Reference Matt's answer from
	REM -- http://stackoverflow.com/questions/7044985/how-can-i-auto-elevate-my-batch-file-so-that-it-requests-from-uac-administrator
	NET FILE 1>NUL 2>NUL
	IF '%errorlevel%' == '0' ( GOTO GOTPRIVILEGES ) ELSE ( GOTO GETPRIVILEGES	)
	:GETPRIVILEGES
		IF '%1'=='ELEV' (ECHO.ELEV & SHIFT & GOTO GETPRIVILEGES )
		ECHO.
		ECHO.We need Administrator Privilege First.
		SETLOCAL DisableDelayedExpansion
		SET "batchPath=%~0"
		SETLOCAL EnableDelayedExpansion
		ECHO.Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
		ECHO.args = "ELEV " >> "%temp%\OEgetPrivileges.vbs"
		ECHO.For Each strArg in WScript.Arguments >> "%temp%\OEgetPrivileges.vbs"
		ECHO.args = args ^& strArg ^& " "  >> "%temp%\OEgetPrivileges.vbs"
		ECHO.Next >> "%temp%\OEgetPrivileges.vbs"
		ECHO.UAC.ShellExecute "!batchPath!", args, "", "runas",	1 >> "%temp%\OEgetPrivileges.vbs"
		"%SystemRoot%\System32\WScript.exe"	"%temp%\OEgetPrivileges.vbs" %*
		EXIT /B
	:GOTPRIVILEGES
		IF '%1'=='ELEV' SHIFT
		SETLOCAL & PUSHD .
		CD /d %GITEXTRAS%
GOTO :ENDUACPROMT

:GETPATHFROMREG
	REM -- Reference https://github.com/git-for-windows/build-extra/blob/master/installer/install.iss
	REM -- and Dan F's answer from
	REM -- http://stackoverflow.com/questions/6866326/variable-from-registry-batch-files
	SET REG.KEY=HKLM\SOFTWARE\GitForWindows
	SET REG.VALUE=InstallPath
	For /F "Tokens=2*" %%A IN ('REG QUERY %REG.KEY% /v %REG.VALUE% 2^>NUL') DO SET INSTALLPATH=%%B
	IF not exist %INSTALLPATH%\cmd\git.exe (
		SET REG.KEY=HKCU\SOFTWARE\GitForWindows
		For /F "Tokens=2*" %%A IN ('REG QUERY %REG.KEY% /v %REG.VALUE% 2^>NUL') DO SET INSTALLPATH=%%B
	)
GOTO :EOF

:JUSTCOPY
	REM -- Copy Commands
	FOR /R %GITEXTRAS%\bin %%i in (*.*) DO (
		ECHO.#!/usr/bin/env bash > %PREFIX%\bin\%%~ni
		TYPE %GITEXTRAS%\helper\reset-env >> %PREFIX%\bin\%%~ni
		TYPE %GITEXTRAS%\helper\git-extra-utility >> %PREFIX%\bin\%%~ni
		>NUL FINDSTR /C:%%~ni %GITEXTRAS%\need_git_repo && (
			TYPE %GITEXTRAS%\helper\is-git-repo	>> %PREFIX%\bin\%%~ni
		)
		MORE +2	%GITEXTRAS%\bin\%%~ni >> %PREFIX%\bin\%%~ni
	)
	REM -- Copy Html Docs Because GitForWindows	does not contain man command
	ROBOCOPY /IS %GITEXTRAS%\man %HTMLDIR% *.html
	REM -- Copy Bash Completion
	COPY %GITEXTRAS%\etc\bash_completion.sh	%BASHCOMPLETION%\git-extras
GOTO :EOF

:CLEARVARIABLES
	SET "INSTALLWAY="
	SET "INSTALLPATH="
	SET "PREFIX="
	SET "HTMLDIR="
	SET "BASHCOMPLETION="
	SET "REG.KEY="
	SET "REG.VALUE="
	SET "NEEDCOPY="
GOTO :EOF

REM -- End Of Installation
:ENDPOINT
ENDLOCAL
@ECHO ON
