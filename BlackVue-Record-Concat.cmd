@echo ##### START BlackVue-Record-Concat        #####
set BlackVueDrive=F:
set concatTXT=BlackVue\BlackVue-Record-ListFileMP4.txt
set concatMP4=BlackVue\BlackVue-Record-concat.mp4
set listFileTXT=BlackVue\BlackVue-Record-ListFileMP4.txt
set listFileMP4=BlackVue\Record\*.mp4
@echo BlackVueDrive=%BlackVueDrive%
@echo concatTXT=%concatTXT%
@echo concatMP4=%concatMP4%
@echo listFileTXT=%listFileTXT%
@echo listFileMP4=%listFileMP4%
@echo ---------------------
mkdir D:\BlackVue\Record
cd D:\BlackVue
:: FIX ERROR https://github.com/mapicam/mapicam/issues/2
ffmpeg -f concat -safe 0 -i %BlackVueDrive%\%concatTXT% -codec copy %BlackVueDrive%\%concatMP4%
@echo ###############################################
@echo ##### END GET BlackVue-Record-Concat      #####
@echo ###############################################
pause
