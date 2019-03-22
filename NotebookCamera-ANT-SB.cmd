// #####################
// ###### MapiCam ######
// #####################
// ## www.t.me/osmUA  ##
// ## @velmyshanovnyi ##
// ##         (c)2019 ##
// #####################

// ReadMe:
// #####################
// download and install FFMPEG
// https://www.ffmpeg.org/
// https://ffmpeg.zeranoe.com/builds/
// copy to "c:\ffmpeg\bin\ffmpeg.exe"
// RUN as Admin:
// setx /M PATH "c:\ffmpeg\bin;%PATH%"
// RUN this file (00.cmd)
// #####################


cd..
cd..
cd..
cd..


// C:\ffmpeg\bin\ffmpeg.exe -codecs
// ffmpeg -codecs


d:
mkdir mapicam_img
cd mapicam_img

mkdir ANT-SB
cd ANT-SB

// #####################################################################################
// https://askdev.info/questions/101927/ffmpeg-command-line-for-capturing-and-recording-audio-and-video-in-720p-from-d
// see devices:
// ffmpeg -list_devices true -f dshow -i dummy

// [dshow @ 046742c0] DirectShow video devices (some may be both video and audio devices)
// [dshow @ 046742c0]  "OV5648"
// [dshow @ 046742c0]     Alternative name "@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}"
// [dshow @ 046742c0]  "GC2355"
// [dshow @ 046742c0]     Alternative name "@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{82a248ab-e5f1-4091-892e-a3853f5c675f}"

// see WebCameraSetting (video):
// ffmpeg -list_options true -f dshow -i video="OV5648"

// [dshow @ 061142c0] DirectShow video device options (from video devices)
// [dshow @ 061142c0]  Pin "Capture" (alternative pin name "Capture")
// [dshow @ 061142c0]   pixel_format=yuyv422  min s=1920x1080 fps=29.97 max s=1920x1080 fps=29.97
// [dshow @ 061142c0]   pixel_format=yuyv422  min s=1280x720 fps=30 max s=1280x720 fps=30
// [dshow @ 061142c0]   pixel_format=yuyv422  min s=640x480 fps=29.97 max s=640x480 fps=29.97
// [dshow @ 061142c0]   pixel_format=yuyv422  min s=640x360 fps=29.97 max s=640x360 fps=29.97

// #####################################################################################


// #####################################################################################

// ##### PREVIEW - ABCDEFGH - START ####################################################
// ANT-SB/Camera -----------------------------------------------------------------------
// "@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}"

// ffplay -f dshow -video_size 640x480 -rtbufsize 20M -i video="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}"

ffmpeg -y -f dshow -video_size 1280x720 -rtbufsize 100M -i video="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}" -r 0.2 -threads 0 -f image2 -qscale:v 2 -strftime 1 "D:\mapicam_img\ANT-SB\mapicam-OV5648-%%Y%%m%%d-%%H%%M%%S.jpg" 

ffplay -f dshow -video_size 640x480 -rtbufsize 20M -framerate 30 -threads 1 -i video="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}"

// ##### PREVIEW - ABCDEFGH - END ######################################################



// #####################################################################################
// ffmpeg -list_devices true -f dshow -i dummy

// see WebCameraSetting (video):
// ffmpeg -list_options true -f dshow -i video="Microsoft® LifeCam HD-3000"