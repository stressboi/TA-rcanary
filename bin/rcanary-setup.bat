@echo off
REM -------------------------------------------
REM brodsky@splunk.com 2JUL21
REM sets up ransomware canary
REM -------------------------------------------


setlocal EnableDelayedExpansion

REM don't run if you already ran
IF EXIST "%SPLUNK_HOME%\etc\apps\TA-rcanary\firsttimerun.txt" (
	exit /b
	)

REM generate a random string of 20 characters
Set _RNDLength=20
Set _Alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
Set _Str=%_Alphanumeric%987654321
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=
:_loop
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
If !_count! lss %_RNDLength% goto _loop

mkdir c:\specialdocs
copy "%SPLUNK_HOME%\etc\apps\TA-rcanary\bin\specialsplkcreds.docx" c:\specialdocs\!_RndAlphaNum!.docx
attrib +h c:\specialdocs
move "%SPLUNK_HOME%\etc\apps\TA-rcanary\bin\flagfile.txt" "%SPLUNK_HOME%\etc\apps\TA-rcanary\bin\firsttimerun.txt"