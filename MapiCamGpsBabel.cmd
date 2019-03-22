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
@set MapiCamImgDateDIR=20190101
@echo .
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath     = %MapiCamFFpath%
@echo MapiCamGBpath     = %MapiCamGBpath%  = C:\Program Files (x86)\GPSBabel
@echo MapiCamImgDrive   = %MapiCamImgDrive%
@echo MapiCamImgFolder  = %MapiCamImgFolder%
@echo MapiCamGpxFolder  = %MapiCamGpxFolder%
@echo MapiCamImgDIR     = default = %MapiCamImgDIR%
@echo MapiCamImgDateDIR = default = %MapiCamImgDateDIR%
@echo #####################

:: pause
:: 


:: 
:: GPSBabel Documentation https://www.gpsbabel.org/readme.html                      
:: GPSBabel Documentation https://www.gpsbabel.org/htmldoc-development/index.html 
:: 
:: 4. Data Filters ====================================                  https://www.gpsbabel.org/htmldoc-development/Data_Filters.html
:: Add points before and after bends in routes (bend)                    https://www.gpsbabel.org/htmldoc-development/filter_bend.html
:: Include Only Points Inside Polygon (polygon)                          https://www.gpsbabel.org/htmldoc-development/filter_polygon.html
:: Include Only Points Within Distance of Arc (arc)                      https://www.gpsbabel.org/htmldoc-development/filter_arc.html
:: Include Only Points Within Radius (radius)                            https://www.gpsbabel.org/htmldoc-development/filter_radius.html
:: Interpolate between trackpoints (interpolate)                         https://www.gpsbabel.org/htmldoc-development/filter_interpolate.html
:: Manipulate altitudes (height)                                         https://www.gpsbabel.org/htmldoc-development/filter_height.html
:: Manipulate track lists (track)                                        https://www.gpsbabel.org/htmldoc-development/filter_track.html
:: Rearrange waypoints by resorting (sort)                               https://www.gpsbabel.org/htmldoc-development/filter_sort.html
:: Remove all waypoints, tracks, or routes (nuketypes)                   https://www.gpsbabel.org/htmldoc-development/filter_nuketypes.html
:: Remove Duplicates (duplicate)                                         https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html
:: Remove Points Within Distance (position)                              https://www.gpsbabel.org/htmldoc-development/filter_position.html
:: Remove unreliable points with high hdop or vdop (discard)             https://www.gpsbabel.org/htmldoc-development/filter_discard.html
:: Reverse stops within routes (reverse)                                 https://www.gpsbabel.org/htmldoc-development/filter_reverse.html
:: Save and restore waypoint lists (stack)                               https://www.gpsbabel.org/htmldoc-development/filter_stack.html
:: Simplify routes (simplify)                                            https://www.gpsbabel.org/htmldoc-development/filter_simplify.html
:: Swap latitude and longitude of all loaded points (swap)               https://www.gpsbabel.org/htmldoc-development/filter_swap.html
:: Transform waypoints into a route, tracks into routes, ... (transform) https://www.gpsbabel.org/htmldoc-development/filter_transform.html
:: Validate internal data structures (validate)                          https://www.gpsbabel.org/htmldoc-development/filter_validate.html
:: A. Supported Datums
:: B. Garmin Icons
:: C. GPSBabel XCSV Style Files
:: C. -- Table of Contents :
:: C. -- Introduction to GPSBabel Styles  https://www.gpsbabel.org/htmldoc-development/styles_intro.html
:: C. -- Style file overview              https://www.gpsbabel.org/htmldoc-development/style_intro2.html
:: C. -- Internal Constants               https://www.gpsbabel.org/htmldoc-development/styles_internal_const.html
:: C. -- Global Properties of the File    https://www.gpsbabel.org/htmldoc-development/style_global.html
:: C. -- GPSBabel Behavior Directives     https://www.gpsbabel.org/htmldoc-development/style_behavior.html
:: C. -- Defining the Layout of the File  https://www.gpsbabel.org/htmldoc-development/style_layout.html
:: C. -- Defining Fields Within the File  https://www.gpsbabel.org/htmldoc-development/style_define.html
:: C. -- Examples                         https://www.gpsbabel.org/htmldoc-development/style_examples.html
:: C. -- Miscellaneous Notes              https://www.gpsbabel.org/htmldoc-development/style_notes.html
:: Glossary                                                             https://www.gpsbabel.org/htmldoc-development/Glossary.html
:: 
:: List of Tables
:: 
:: 4.1.  Using the polygon filter                                                        https://www.gpsbabel.org/htmldoc-development/filter_polygon.html#example_polygon_filter
:: 4.2.  Using the polygon and arc filters to find points in or nearly in a polygon      https://www.gpsbabel.org/htmldoc-development/filter_polygon.html#example_in_or_close_to
:: 4.3.  Using the arc filter                                                            https://www.gpsbabel.org/htmldoc-development/filter_arc.html#example_arc_filter
:: 4.4.  Using the radius filter to find points close to a given point                   https://www.gpsbabel.org/htmldoc-development/filter_radius.html#radius_to_find_points_close
:: 4.5.  Using the interpolate filter                                                    https://www.gpsbabel.org/htmldoc-development/filter_interpolate.html#example_interpolate_filter
:: 4.6.  This option subtracts the WGS84 geoid height from every altitude. For GPS receivers like the iBlue747 the result is the height above mean see level.    https://www.gpsbabel.org/htmldoc-development/filter_height.html#height_wgs84tomsl
:: 4.7.  This options adds a constant value to every altitude.                           https://www.gpsbabel.org/htmldoc-development/filter_height.html#height_add
:: 4.8.  Time-shifting a track with the track filter                                     https://www.gpsbabel.org/htmldoc-development/filter_track.html#ex_track_move
:: 4.9.  Merging tracks with the track filter                                            https://www.gpsbabel.org/htmldoc-development/filter_track.html#ex_track_merge
:: 4.10. Extracting a period of time with the track filter                               https://www.gpsbabel.org/htmldoc-development/filter_track.html#ex_track_startstop
:: 4.11. Replace time values of a track                                                  https://www.gpsbabel.org/htmldoc-development/filter_track.html#ex_track_faketime1
:: 4.12. Add time values to a track                                                      https://www.gpsbabel.org/htmldoc-development/filter_track.html#ex_track_faketime2
:: 4.13. Merging tracks with missing timestamps with the track filter                    https://www.gpsbabel.org/htmldoc-development/filter_track.html#ex_track_discard
:: 4.14. Filtering data types with nuketypes                                             https://www.gpsbabel.org/htmldoc-development/filter_nuketypes.html#example_nuketypes_filter
:: 4.15. Using the duplicate filter to suppress points with the same name and location   https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html#duplicate_to_suppress_points
:: 4.16. Using the duplicate filter to implement an "ignore list."                       https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html#duplicate_to_ignore
:: 4.17. Using the duplicate filter to correct the locations of "puzzle" geocaches       https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html#Correcting_Cache_Locations
:: 4.18. Using the position filter to suppress close points                              https://www.gpsbabel.org/htmldoc-development/filter_position.html#posn_to_suppress_close_points
:: 4.19. Using the discard filter for HDOP and VDOP.                                     https://www.gpsbabel.org/htmldoc-development/filter_discard.html#example_discard_filter
:: 4.20. Using the discard filter to require at least three satellites.                   https://www.gpsbabel.org/htmldoc-development/filter_discard.html#example_discard_filter_sats
:: 4.21. Discarding specific point by regular expression                                 https://www.gpsbabel.org/htmldoc-development/filter_discard.html#discarding_points_with_names
:: 4.22. Converting a track to a sequence of waypoints                                   https://www.gpsbabel.org/htmldoc-development/filter_transform.html#transform_to_wpt
:: 4.23. Converting a pile of waypoints to a GPX route                                   https://www.gpsbabel.org/htmldoc-development/filter_transform.html#transform_to_rte
:: 4.24. Converting a pile of waypoints to a GPX track                                   https://www.gpsbabel.org/htmldoc-development/filter_transform.html#transform_to_trk
:: 4.25. Convert a GPX track to a GPX route, deleting the original track, using 2 digits for the generated numbers.                    https://www.gpsbabel.org/htmldoc-development/filter_transform.html#transform_rptdigits
:: 4.26. Convert a GPX track to a GPX route, deleting the original track, naming the generated points like the original track name.    https://www.gpsbabel.org/htmldoc-development/filter_transform.html#transform_rptname
:: 4.27. Convert a GPX track to GPX waypoints, tossing the original track                https://www.gpsbabel.org/htmldoc-development/filter_transform.html#transform_del
:: 
:: 


cd..
cd..
cd..
cd..

%MapiCamImgDrive%
mkdir %MapiCamGpxFolder%
cd %MapiCamGpxFolder%
mkdir %MapiCamImgDateDIR%
cd %MapiCamImgDateDIR%
mkdir merged
mkdir interpolate


@echo .
@echo Remove Duplicates (duplicate)
@echo https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html
@echo :: SKIP next line
@echo :: %MapiCamGBpath%\gpsbabel.exe -i gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\1.gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\2.gpx -x duplicate,location,shortname -o gpx -F %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\merget\%MapiCamImgDateDIR%-merget.gpx
@echo .


@echo .
@echo Interpolate between trackpoints (interpolate)
@echo https://www.gpsbabel.org/htmldoc-development/filter_interpolate.html
:: %MapiCamGBpath%\gpsbabel.exe -i gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\merget\%MapiCamImgDateDIR%-merget.gpx -x interpolate,time=1 -o gpx -F %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\interpolate\%MapiCamImgDateDIR%-interpolate.gpx
%MapiCamGBpath%\gpsbabel.exe -i gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\%MapiCamImgDateDIR%.gpx -x interpolate,time=1 -o gpx -F %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\interpolate\%MapiCamImgDateDIR%-interpolate.gpx
@echo .
@echo .






ECHO ##### GOTOVO :) #####
pause
