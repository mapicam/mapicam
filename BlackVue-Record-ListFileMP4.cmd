@echo #####  START BlackVue-Record-ListFileMP4  #####
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
(for %%i in (%BlackVueDrive%\%listFileMP4%) do @echo file '%%i') > %BlackVueDrive%\%listFileTXT%
@echo ###############################################
@echo ##### END GET BlackVue-Record-ListFileMP4 #####
@echo ###############################################
pause
