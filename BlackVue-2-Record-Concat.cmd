::
:: ###################################################
:: #                                                 #
:: #                    MapiCam                      #
:: #                                                 #
:: ###################################################
:: #                                                 #
:: #  www.t.me/osmUA                                 #
:: #  @velmyshanovnyi                                #
:: #                                         (c)2019 #
:: #                                                 #
:: ###################################################
::
:: ###################################################
:: #                                                 #
:: #                    ReadMe                       #
:: #                                                 #
:: ###################################################
::
:: ###################################################
:: #                                                 #
:: # https://t.me/osmUA                              #
:: # https://t.me/MapillaryUkraine                   #
:: # https://t.me/MapillaryUkraineChat               #
:: # https://github.com/mapicam/mapicam              #
:: # https://github.com/mapicam/mapicam/wiki         #
:: #                                                 #
:: ###################################################
::

@echo.
@echo ####################################################
@echo #                                                  #
@echo # START : [2] BlackVue-Record-Concat               #
@echo #                                                  #
@echo ####################################################
@echo.
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
@echo ####################################################
@echo #                                                  #
@echo # END   : [2] BlackVue-Record-Concat               #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # NEXT  : [3] BlackVue-Video2Photo                 #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
