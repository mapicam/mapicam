@echo ##### START BlackVue-Record-ListFileMP4 #######
@echo https://github.com/mapicam/mapicam/wiki
@echo ###############################################
:: BlackVue=F:\BlackVue
set BlackVue=%1%
set listFileTXT=BlackVue-Record-ListFileMP4.txt
set listFileMP4=*.mp4
@echo BlackVue=%BlackVue%
@echo listFileTXT=%listFileTXT%
@echo listFileMP4=%listFileMP4%
@echo ---------------------
mkdir %BlackVue%\Record
cd %BlackVue%\Record
(for %%i in (%BlackVue%\Record\%listFileMP4%) do @echo file '%%i') > %BlackVue%\%listFileTXT%
@echo ###############################################
@echo ##### END GET BlackVue-Record-ListFileMP4 #####
@echo ###############################################
@echo ##### NEXT USE BlackVue-Record-Concat.cmd #####
@echo ###############################################
pause
