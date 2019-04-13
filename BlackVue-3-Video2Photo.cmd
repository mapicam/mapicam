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
@echo ###################################################
@echo #                                                 #
@echo # START : [3] BlackVueVideo2Photo                 #
@echo #                                                 #
@echo ###################################################
@echo.

setlocal enableextensions enabledelayedexpansion
:: BlackVue=F:\BlackVue
set BlackVue=%1%
:: BlackVueFPS=10
set BlackVueFPS=%2%
:: BlackVueInterval=0.1
set BlackVueInterval=%3%
@echo.
@echo BlackVue         = %BlackVue%
@echo BlackVueFPS      = %BlackVueFPS%
@echo BlackVueInterval = %BlackVueInterval%
@echo.
mkdir "%BlackVue%\Record"
mkdir "%BlackVue%\Record\%BlackVueFPS%fps"
mkdir "%BlackVue%\Record\gpx"
:: mkdir "F:\BlackVue\Record\csv"
:: треба зробити (колись пізніше)-1: на цьому ж етапі генерувати і текстовий файл з координатами.
:: треба зробити (колись пізніше)-2: знайти якийсь аналог до --skip_subfolders , бо процес на ВСІ підпапки займає занадто багато часу, і іноді вилітає, що тягне за собою видалення всього, та повний повторний прогон рендеренгу.
mapillary_tools video_process --advanced --verbose --user_name velmyshanovnyi --import_path "%BlackVue%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVue%\Record" --geotag_source "blackvue_videos" --geotag_source_path "%BlackVue%\Record" --use_gps_start_time --offset_angle 0 --interpolate_directions --video_sample_interval %BlackVueInterval% --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_EXIF_gps_tag --duplicate_distance %BlackVueInterval%
:: УВАГА!!!
:: якщо з якоїсь причини папки (каталоги)
:: --video_import_path "%BlackVue%\Record"
:: та
:: --geotag_source_path "%BlackVue%\Record"
:: будуть відрізнятись - то це викличе помилку:
:: Warning, required geotag_process did not result in a valid json file for image F:\BlackVue\Record\10fps\mapillary_sampled_video_frames\20190404_081744_NF\20190404_081744_NF_000610.jpg
:: і згенеровані файли (.JPG) НЕ БУДУТЬ ПРОШИТІ КООРДИНАТАМИ ІЗ ВІДЕО 
:: УВАГА!!! END

move "%BlackVue%\Record\*.gpx" "%BlackVue%\Record\gpx"

@echo.
@echo.
@echo.
@echo ###################################################
@echo #                                                 #
@echo # END   : [3] BlackVueVideo2Photo                 #
@echo #                                                 #
@echo ###################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!