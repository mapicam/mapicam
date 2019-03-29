# MapiCam

MapiCam - комплекс для фото-мапінгу на декілька вебкамер, з подальшим процесінгом та завантаженням на Mapillary (https://github.com/mapillary)

ідея - створення програмного комплексу для автоматизації зйомки (та в майбутньому заливки) на більше як одній Веб-Камерах, з прописуванням GPS даних в EXIF. (*)

прогноз - можливість автоматизувати та створити підґрунтя для поширення даної методики в маси, що дозволить збільшити кількісно об'Єм фотоконтенту для Мапілларі, що в свою чергу позитивно вплине на екосистему OSM.

наразі все відтестовано на windows10


---
# робочі папки:
- D:\mapicam_gpx      - файли з вже записаними треками
- D:\mapicam_img      - сюди пишуться фотографії з камер, а також тут з ними відбувається постобробка (прошивка часу та координат)
- D:\mapicam_sample   - семпли для тестування 
- D:\mapicam_tools    - утиліти
- D:\mapicam2upload   - папка на завантаження на Mapillary 


- C:\ffmpeg           - стандартний FFMPEG та ExifTools (структуру буде розписано окремо)
- C:\Python27         - Python-2.7  (додаткові встановлені модулі буде розписано окремо)
---



# Налаштування для .LNK
D:\mapicam\MapiCamRunVideo.cmd 01 d:
- де 01 --> MapiCamImgDIR=%1% --> назва камери
- де d: --> MapiCamDrive =%2% --> назва диску куди будуть збережені матеріали.


# Налаштування для мапілларі
- Normalize Sequence - розгортає фотки секвенції в напрямку руху (фактично компас)
- Set Offset         - зміщує кут на значення кута повороту камери.


# ERROR
- Q: Could not run graph (sometimes caused by a device already in use by other application)
- A: розібратись...
- A: ...ймовірно (за деякими спостереженнями) це може бути викликане тим, що вебкамера активує мікрофон, і не хоче його деактивовувати, що й призводить до того що "пристрій зайнятий". треба спробувати якимось чином примусово "вимикати" мікрофон.

- Q: Option b:v (video bitrate (please use -b:v)) cannot be applied to input url [video=%MapiCamName%] -- you are trying to apply an input option to an output file or vice versa. Move this option before the file it belongs to. 
- A: розібратись...

- Q: Error parsing options for input file [video=%MapiCamName%]. 
- A: розібратись...

- Q: Error opening input files [video=%MapiCamName%]: Invalid argument
- A: розібратись...

- Q: Pixel format may only be set when video codec is not set or set to rawvideo
- A: КОСТИЛЬ: прибрати зі скрипта "-pixel_format %MapiCamPixelFormat%" 



// #####################################################################################
// CAM-1 = P/N:X822025-004 PID:03210-545-529359 2-01218
// CAM-2 = P/N:X822025-004 PID:03210-545-529285 4-01218
// CAM-3 = P/N:X822025-004 PID:03210-545-529294 4-01218
// CAM-4 = P/N:X822025-004 PID:03210-545-529349 4-01218
// CAM-5 = P/N:X822025-004 PID:03210-545-529362 1-01218
// CAM-6 = P/N:X822025-004 PID:03210-545-529293 5-01218
// CAM-7 = P/N:X822025-004 PID:03210-545-52**** 6-01224 (sterlys' cyfry)
// CAM-8 = P/N:X822025-004 PID:03210-545-529292 6-01218
// #####################################################################################

