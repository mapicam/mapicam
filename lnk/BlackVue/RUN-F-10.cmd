@echo #####################
@echo ###### MapiCam ######
@echo #####################
@echo ## www.t.me/osmUA  ##
@echo ## @velmyshanovnyi ##
@echo ##         (c)2019 ##
@echo #####################
@echo. 
@echo #####################
@echo ####   ReadMe   #####
@echo #####################
@echo. 
@echo https://t.me/osmUA
@echo https://t.me/MapillaryUkraine
@echo https://t.me/MapillaryUkraineChat
@echo https://github.com/mapicam/mapicam
@echo https://github.com/mapicam/mapicam/wiki
@echo. 




::1
CALL D:\mapicam\BlackVue-Record-ListFileMP4.cmd F:\BlackVue

::2
CALL D:\mapicam\BlackVue-Record-Concat.cmd F:\BlackVue

::3
CALL D:\mapicam\BlackVue-Video2Photo.cmd F:\BlackVue 10 0.1
:: CALL D:\mapicam\BlackVue-Video2Photo.cmd F:\BlackVue 10 0.5
:: CALL D:\mapicam\BlackVue-Video2Photo.cmd F:\BlackVue 10 1

::4
CALL D:\mapicam\BlackVue-MergeGPX.cmd F:\BlackVue

::5
CALL D:\mapicam\BlackVue-MoveJPG.cmd F:\BlackVue 10

::6
CALL D:\mapicam\BackVue-FixDateTime.cmd F:\BlackVue 01

::7


@echo.
@echo.
@echo.
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
@echo.
@echo.
@echo.
cmd /k
