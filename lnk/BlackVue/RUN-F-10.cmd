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

pause

::1
D:\mapicam\BlackVue-Record-ListFileMP4.cmd F:\BlackVue

::2
D:\mapicam\BlackVue-Record-Concat.cmd F:\BlackVue

::3
D:\mapicam\BlackVue-Video2Photo.cmd F:\BlackVue 10 0.1

::4
D:\mapicam\BlackVue-MergeGPX.cmd F:\BlackVue

::5
D:\mapicam\BlackVue-MoveJPG.cmd F:\BlackVue 10

::6
D:\mapicam\BackVue-FixDateTime.cmd F:\BlackVue 01

::7



@echo.
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
pause