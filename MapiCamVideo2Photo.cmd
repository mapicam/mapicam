:: #####################
:: ###### MapiCam ######
:: #####################
:: ## www.t.me/osmUA  ##
:: ## @velmyshanovnyi ##
:: ##         (c)2019 ##
:: #####################
:: 
:: https://t.me/osmUA
:: https://t.me/MapillaryUkraine
:: https://t.me/MapillaryUkraineChat
:: https://t.me/joinchat/BYnnNRYLZdfub5u4MMvsRQ (MapiCam Chat)
:: 
:: #####################
:: ####   ReadMe   #####
:: #####################
:: 
:: 
:: #####################
:: # This is parametrs #
:: #####################
setlocal EnableDelayedExpansion
@set MapiCamFFpath=c:\ffmpeg\bin
@set MapiCamGBpath=C:\Progra~2\GPSBabel
@set MapiCamImgDrive=D:
@set MapiCamImgFolder=mapicam_img
@set MapiCamGpxFolder=mapicam_gpx
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%1%
@set MapiCamHead=0
@set MapiCamImgDateDIR=20190323
@echo .
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath		= %MapiCamFFpath%
@echo MapiCamGBpath     = %MapiCamGBpath%  = C:\Program Files (x86)\GPSBabel
@echo MapiCamImgDrive	= %MapiCamImgDrive%
@echo MapiCamImgFolder	= %MapiCamImgFolder%
@echo MapiCamGpxFolder  = %MapiCamGpxFolder%
@echo MapiCamImgDIR     = default = %MapiCamImgDIR%
@echo MapiCamImgDateDIR = default = %MapiCamImgDateDIR%
@echo #####################
@echo .
:: #####################

ffmpeg -r 1 %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamImgDateDIR%.flv -r 1 "$%MapiCamImgDateDIR%%03d.png"




