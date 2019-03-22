@echo :: #####################
@echo :: ###### MapiCam ######
@echo :: #####################
@echo :: ## www.t.me/osmUA  ##
@echo :: ## @velmyshanovnyi ##
@echo :: ##         (c)2019 ##
@echo :: #####################
@echo :: 
@echo :: https://t.me/osmUA
@echo :: https://t.me/MapillaryUkraine
@echo :: https://t.me/MapillaryUkraineChat
@echo :: https://t.me/joinchat/BYnnNRYLZdfub5u4MMvsRQ (MapiCam Chat)
@echo :: 
@echo :: #####################
@echo :: ####   ReadMe   #####
@echo :: #####################
@echo .
@echo .
@echo . https://github.com/mapillary/mapillary_tools
@echo .
pause
@echo https://github.com/mapillary/mapillary_tools
pause

:: зберегти оригінал
:: mapillary_tools process_and_upload --advanced --import_path "20190101/test/adjusted" --user_name velmyshanovnyi --keep_original

:: видаляти файл після завантаження 
mapillary_tools process_and_upload --advanced --import_path "20190101/A/adjusted" --user_name velmyshanovnyi

@echo .
@echo :: #####################
@echo :: ##### GOTOVO :) #####
@echo :: #####################
pause
