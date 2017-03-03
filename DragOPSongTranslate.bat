@echo off
title DragOPSongTranslate
::Create file for input.txt if not already made.
IF NOT EXIST input.txt echo Put all the song lyrics, here(remove this).> input.txt
echo.Change regular lyrics into code for SingSong, for DragOP.js. 
echo.Put all text into Input.txt - Linebreaks represent a new chat message.
echo.Output of translated text will be in Output.txt
echo.
echo.Press any key to start...
pause >nul
set /p Songname=Song Name: 

::Add /n(splitter) on each and every line.
setLocal EnableDelayedExpansion
for /f "tokens=* delims= " %%a in (input.txt) do (
set /a N+=1
echo %%a\n>>Part-1-Translate.txt)

::Move all text onto one line
for /f "delims=" %%a in (Part-1-Translate.txt) do (
echo/|set /p ="%%a" )>>Part-2-translate.txt

::Cut Extra /n
set /p cut=<Part-2-Translate.txt
echo %cut:~0,-3%> Part-2-Translate.txt

::Add DragOP/ModPE formated code.
set /p Convert2=<Part-2-translate.txt
set Convereted3=["%songname%", "%Convert2%".split("\n")],
echo %Convereted3%>output.txt

::Remove no longer needed files.
del part-1-translate.txt
del part-2-translate.txt
::Text output
cls & type output.txt
echo.
echo.Above is also in output.txt
echo.
echo.Press any key to exit.
pause >nul