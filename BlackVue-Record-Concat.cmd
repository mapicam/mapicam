@echo ##### START BlackVue-Record-Concat        #####
set concatTXT=D:\BlackVue\BlackVue-Record-ListFileMP4.txt
set concatMP4=D:\BlackVue\BlackVue-Record-concat.mp4
set listFileTXT=D:\BlackVue\BlackVue-Record-ListFileMP4.txt
set listFileMP4=D:\BlackVue\Record\*.mp4
@echo concatTXT=%concatTXT%
@echo concatMP4=%concatMP4%
@echo listFileTXT=%listFileTXT%
@echo listFileMP4=%listFileMP4%
@echo ---------------------
mkdir D:\BlackVue\Record
cd D:\BlackVue
:: FIX ERROR https://github.com/mapicam/mapicam/issues/2
ffmpeg -f concat -safe 0 -i %concatTXT% -codec copy %concatMP4%
@echo ###############################################
@echo ##### END GET BlackVue-Record-Concat      #####
@echo ###############################################
pause
