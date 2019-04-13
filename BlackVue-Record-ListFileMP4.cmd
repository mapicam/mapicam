@echo.
@echo ###################################################
@echo #                                                 #
@echo # START : [1] BlackVue-Record-ListFileMP4         #
@echo #                                                 #
@echo ###################################################
setlocal enabledelayedexpansion
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

@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # END   : [1] BlackVue-Record-ListFileMP4          #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # NEXT  : [2] BlackVue-Record-Concat               #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
