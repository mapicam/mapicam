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


-----
#####################################################################################
CAM-1 = P/N:X822025-004 PID:03210-545-529359 2-01218
CAM-2 = P/N:X822025-004 PID:03210-545-529285 4-01218
CAM-3 = P/N:X822025-004 PID:03210-545-529294 4-01218
CAM-4 = P/N:X822025-004 PID:03210-545-529349 4-01218
CAM-5 = P/N:X822025-004 PID:03210-545-529362 1-01218
CAM-6 = P/N:X822025-004 PID:03210-545-529293 5-01218
CAM-7 = P/N:X822025-004 PID:03210-545-52**** 6-01224 (sterlys' cyfry)
CAM-8 = P/N:X822025-004 PID:03210-545-529292 6-01218
#####################################################################################
-----

// ANT-SSD/MonitorUsbTop    // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#9&12c23322&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global" // 
// ANT-SSD/MonitorUsbTop    // "Desktop Microphone (3- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{CCB34AE2-1D6B-41E7-BA92-9104A75CA7B1}"
// ANT-SSD/MonitorUsbDown   // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#9&8827d&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global" // 
// ANT-SSD/MonitorUsbDown   // "Desktop Microphone (4- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{790FB3C7-1C6A-4E6F-85FA-B510C6336DA9}"

// ANT-SSD/Line1L=ERROR!    // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&1f9dda4f&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line1L=ERROR!    // "Desktop Microphone (5- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{5FA51EE7-8252-4276-96F0-80EF2B572E34}"
// ANT-SSD/Line1R=ERROR!    // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&32578af4&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line1R=ERROR!    // "Desktop Microphone (6- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{AE5F740B-E908-42D8-98FB-C97993170E60}"

// ANT-SSD/Line2L           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&9767192&4&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line2L           // "Desktop Microphone (Microsoft® LifeCam HD-3000)"  // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{E7EA25CA-2B71-4A7B-A001-8330AA74E170}"
// ANT-SSD/Line2R           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&1c302237&4&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line2R           // "Desktop Microphone (2- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{2F14A596-AC2E-4796-B3D0-7D93556E2BA7}"


// ANT-SSD/Line3L           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&6ba0f70&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line3L           // "Desktop Microphone (7- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{47D8A82E-1AE2-4114-8DB7-8857BE834772}"
// ANT-SSD/Line3R           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&1973c015&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line3R           // "Desktop Microphone (8- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{3225701F-279E-4BD4-92A5-B1F6F0B7ADD3}"

// ANT-SSD/Line4L           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&2c2d70ba&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line4L           // "Desktop Microphone (9- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{F738FC39-8470-4F9C-A264-DCB599C4BD53}"
// ANT-SSD/Line4R           // "Microsoft┬о LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&34c5758&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line4R           // "Desktop Microphone (10- Microsoft┬о LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{E390F83D-0220-421B-8D4C-1189248DAA57}"


// ANT-SSD/Line4L           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&2c2d70ba&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line4L           // "Desktop Microphone (9- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{F738FC39-8470-4F9C-A264-DCB599C4BD53}"
// ANT-SSD/Line4R           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&34c5758&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line4R           // "Desktop Microphone (10- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{E390F83D-0220-421B-8D4C-1189248DAA57}"

// ANT-SSD/Line5L           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&2de5f28f&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line5L           // "Desktop Microphone (11- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{5AC02579-E903-42FE-AB8D-13936D4A9510}"
// ANT-SSD/Line5R           // "Microsoft® LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&504d92d&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-SSD/Line5R           // "Desktop Microphone (12- Microsoft® LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{D7901110-6066-491F-96F9-A466DE39D448}"

// ##### LSU-HP ########################################################################

// LSU-HP-WebCam
:: LSU-HP/notebook--/"HP Webcam" // "@device_pnp_\\?\usb#vid_04f2&pid_b52d&mi_00#6&362501d0&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: LSU-HP/notebook--"╨Ь╨╕╨║╤А╨╛╤Д╨╛╨╜ (Realtek High Definition Audio)"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{DDF253A2-E355-4928-A956-1D74D9197ADA}"
:: LSU-HP/USB-A--"Microsoft® LifeCam HD-3000"="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&39f754f8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: LSU-HP/USB-A--"╨Э╨░╤Б╤В╨╛╨╗╤М╨╜╤Л╨╣ ╨╝╨╕╨║╤А╨╛╤Д╨╛╨╜ (2- Microsoft® LifeCam HD-3000)"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{63F7B6B2-3B5B-4458-935C-A8C93F820925}"
:: LSU-HP/USB-B--"Microsoft® LifeCam HD-3000"="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&273da453&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: LSU-HP/USB-B--"╨Э╨░╤Б╤В╨╛╨╗╤М╨╜╤Л╨╣ ╨╝╨╕╨║╤А╨╛╤Д╨╛╨╜ (Microsoft® LifeCam HD-3000)"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{F2CA1238-1A06-4AB0-B604-181247FB425D}"
:: LSU-HP/USB-C--"Microsoft® LifeCam HD-3000"="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&258516cf&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: LSU-HP/USB-C--"╨Э╨░╤Б╤В╨╛╨╗╤М╨╜╤Л╨╣ ╨╝╨╕╨║╤А╨╛╤Д╨╛╨╜ (3- Microsoft® LifeCam HD-3000)"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{8D955D5F-939E-4A04-B3B3-01AE1DC09A05}"

// ##### ANT-SB ########################################################################

:: ANT-SB/planshet--"OV5648"="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}"
:: ANT-SB/planshet--"GC2355"="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{82a248ab-e5f1-4091-892e-a3853f5c675f}"
:: ANT-SB/planshet--"Microphone (Realtek High Definition Audio(SST))"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{10E6AD4E-7493-4410-B7AB-8DBECCF38A4B}"

:: ANT-SB/USB-D/Top--"Microsoft® LifeCam HD-3000"="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&7028550&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: ANT-SB/USB-D/Top--"Desktop Microphone (2- Microsoft® LifeCam HD-3000)"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{E61A8800-3A5B-48F7-AFDA-3667CBD7FB75}"
:: ANT-SB/USB-E/Down--"Microsoft® LifeCam HD-3000"="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&1d29ee0d&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: ANT-SB/USB-E/Down--"Desktop Microphone (Microsoft® LifeCam HD-3000)"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{6461F01A-0DDA-4332-B5C0-8461F8E8052C}"


// ##### ANT-ACER ########################################################################

// ANT-ACER/audio           // "Microphone (High Definition Audio Device)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{11577481-3623-4F9B-A379-60898EC341B5}"
// ANT-ACER/audio           // "Line In (High Definition Audio Device)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{4A92884C-1DC4-4052-B9FD-9850E11FDC9E}"
// ANT-ACER/audio           // "Microphone (High Definition Audio Device)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{F08B4563-AA18-4AB9-845D-0538E161B9CD}"

// ANT-ACER/USBportF        // "Microsoft┬о LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&e2531b3&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-ACER/USBportF        // "Desktop Microphone (Microsoft┬о LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{8908E821-011C-4403-912A-84AC423F3A69}"

// ANT-ACER/USBportG        // "Microsoft┬о LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&2a07e03c&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-ACER/USBportG        // "Desktop Microphone (2- Microsoft┬о LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{0F1E4793-F17B-41D5-A030-14F1AE5B002B}"

// ANT-ACER/USBportH        // "Microsoft┬о LifeCam HD-3000" // "@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&126c6da&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
// ANT-ACER/USBportH        // "Desktop Microphone (3- Microsoft┬о LifeCam HD-3000)" // "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{2D598971-0E8E-4212-8AC4-10FF24CD4B7D}"

// #####################################################################################
