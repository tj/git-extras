@ECHO OFF
SET PREFIX=C:\SCM\PortableGit\mingw64
:: default for Git for Windows 2.x
@if exist "%ProgramFiles%\Git" (
    set PREFIX="%ProgramFiles%\Git\mingw64"
)
IF NOT "%~1"=="" SET PREFIX="%~1"
SET HTMLDIR=%PREFIX%\share\doc\git-doc
SET GITEXTRAS=%~dp0

IF NOT EXIST %PREFIX%\etc\bash_completion.d MKDIR %PREFIX%\etc\bash_completion.d
COPY %GITEXTRAS%\etc\bash_completion.sh	%PREFIX%\etc\bash_completion.d\git-extras

FOR /R %GITEXTRAS%\bin %%i in (*.*) DO (
	ECHO #!/usr/bin/env bash > %PREFIX%\bin\%%~ni
	TYPE %GITEXTRAS%\helper\reset-env >> %PREFIX%\bin\%%~ni
	TYPE %GITEXTRAS%\helper\git-extra-utility >> %PREFIX%\bin\%%~ni
	>NUL FINDSTR /C:%%~ni %GITEXTRAS%\need_git_repo && (
		TYPE %GITEXTRAS%\helper\is-git-repo >> %PREFIX%\bin\%%~ni
	)
	MORE +2 %GITEXTRAS%\bin\%%~ni >> %PREFIX%\bin\%%~ni
)

ROBOCOPY /IS %GITEXTRAS%\man %HTMLDIR% *.html

@ECHO ON
