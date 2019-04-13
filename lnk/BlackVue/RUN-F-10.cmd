@echo.
@echo ###################################################
@echo #                                                 #
@echo #                    MapiCam                      #
@echo #                                                 #
@echo ###################################################
@echo #                                                 #
@echo #  www.t.me/osmUA                                 #
@echo #  @velmyshanovnyi                                #
@echo #                                         (c)2019 #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo #                    ReadMe                       #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo # https://t.me/osmUA                              #
@echo # https://t.me/MapillaryUkraine                   #
@echo # https://t.me/MapillaryUkraineChat               #
@echo # https://github.com/mapicam/mapicam              #
@echo # https://github.com/mapicam/mapicam/wiki         #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo # START : RUN-F-10                                #
@echo #                                                 #
@echo ###################################################
@echo.

::1
CALL D:\mapicam\BlackVue-1-Record-ListFileMP4.cmd F:\BlackVue

::2
CALL D:\mapicam\BlackVue-2-Record-Concat.cmd F:\BlackVue

::3
CALL D:\mapicam\BlackVue-3-Video2Photo.cmd F:\BlackVue 10 0.1
:: CALL D:\mapicam\BlackVue-3-Video2Photo.cmd F:\BlackVue 10 0.5
:: CALL D:\mapicam\BlackVue-3-Video2Photo.cmd F:\BlackVue 10 1

::4
CALL D:\mapicam\BlackVue-4-MergeGPX.cmd F:\BlackVue

::5
CALL D:\mapicam\BlackVue-5-MoveJPG.cmd F:\BlackVue 10

::6
CALL D:\mapicam\BlackVue-6-FixDateTime.cmd F:\BlackVue 01

::7
CALL D:\mapicam\BlackVue-7-Gpx2Exif.cmd F:\BlackVue 01


::8

@echo.
@echo.
@echo.
@echo ###################################################
@echo #                                                 #
@echo #                  END PROCESS                    #
@echo #                                                 #
@echo ###################################################
@echo.
@echo.
@echo.
cmd /k
