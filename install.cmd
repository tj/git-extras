@ECHO OFF
SET PREFIX=C:\SCM\PortableGit\mingw64
SET HTMLDIR=%PREFIX%\share\doc\git-doc
SET GITEXTRAS=%~dp0

IF NOT EXIST %PREFIX%\bin MKDIR %PREFIX%\bin

SET COMMANDS_WITHOUT_REPO=git-alias git-extras git-fork git-setup

FOR /R %GITEXTRAS%\bin %%i in (*.*) DO (
	ECHO #!/usr/bin/env bash > %PREFIX%\bin\%%~ni
	TYPE %GITEXTRAS%\helper\reset-env >> %PREFIX%\bin\%%~ni
	TYPE %GITEXTRAS%\helper\git-extra-utility >> %PREFIX%\bin\%%~ni
	TYPE %GITEXTRAS%\helper\is-git-repo >> %PREFIX%\bin\%%~ni
	MORE +2 %GITEXTRAS%\bin\%%~ni >> %PREFIX%\bin\%%~ni
)

FOR %%i in (%COMMANDS_WITHOUT_REPO%) DO (
	ECHO #!/usr/bin/env bash > %PREFIX%\bin\%%i
	TYPE %GITEXTRAS%\helper\reset-env >> %PREFIX%\bin\%%i
	TYPE %GITEXTRAS%\helper\git-extra-utility >> %PREFIX%\bin\%%i
	MORE +2 %GITEXTRAS%\bin\%%i >> %PREFIX%\bin\%%i
)

ROBOCOPY %GITEXTRAS%\man %HTMLDIR% *.html

@ECHO ON