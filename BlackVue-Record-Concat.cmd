@echo ###################################################
@echo ##### START BlackVue-Record-Concat            #####
@echo ##### https://github.com/mapicam/mapicam/wiki #####
@echo ###################################################
setlocal enableextensions enabledelayedexpansion
:: BlackVue=F:\BlackVue
set BlackVue=%1%
set concatTXT=BlackVue-Record-ListFileMP4.txt
set concatMP4=BlackVue-Record-concat.mp4
@echo BlackVueDrive=%BlackVue%
@echo concatTXT=%concatTXT%
@echo concatMP4=%concatMP4%
@echo ---------------------
mkdir %BlackVue%\Record
cd %BlackVueDrive%
:: FIX ERROR https://github.com/mapicam/mapicam/issues/2
ffmpeg -y -f concat -safe 0 -i %BlackVue%\%concatTXT% -codec copy %BlackVue%\%concatMP4%
@echo.
@echo.
@echo ###################################################
@echo ##### END GET BlackVue-Record-Concat          #####
@echo ###################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
