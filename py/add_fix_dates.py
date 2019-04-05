#!/usr/bin/python

import sys
import os
import datetime
import pyexiv2
import math
import time
from pyexiv2.utils import make_fraction


'''
Script for adding dates to jpg files extracted from video with no tags. if you have a directory of files
provide the directory, the datetime for the first file, and an increment in seconds. Ie if the photos are 
taken every 2 seconds 
python add_fix_dates.py /home/me/myphotos/ '2014-11-27 13:01:01' 2
You can use local time, that is expected. Maybe GMT if i get to it. 

!!! This version needs testing, please report issues.!!!

Requires pyexiv2, see install instructions at http://tilloy.net/dev/pyexiv2/
(or use your favorite installer, e.g. 'brew install pyexiv2').
'''


def add_exif_using_timestamp(filename, start_time, offset_time):
    '''
    Find lat, lon and bearing of filename and write to EXIF.
    '''

    metadata = pyexiv2.ImageMetadata(filename)
    metadata.read()
    t = start_time + datetime.timedelta(seconds=offset_time)
    print("setting {0} time to {1} due to offset {2}".format(os.path.basename(filename), t, offset_time))
	
    try:
       metadata["Exif.Photo.DateTimeOriginal"] = t;
       metadata.write()
       return t
    except ValueError as e:
        print("Skipping {0}: {1}".format(filename, e))


if __name__ == '__main__':
    '''
    Use from command line as: python add_fix_dates.py images-path StartTime increment-in-seconds
    if you provide a start time and increment, the first photo will be tagged at start time, and
    each subsequent photo will be tagged with prior photo + increment seconds. 
 
    '''

    if len(sys.argv) < 3 or len(sys.argv) > 4:
        #print("Usage: python add_fix_dates.py images-path starttime (yyyy-mm-dd hh:mm:ss) increment-in-seconds")
        print("Usage: python add_fix_dates.py images-path starttime (yyyy-mm-dd hh:mm:ss) fps")
        raise IOError("Bad input parameters.")
    path = sys.argv[1]
    start_time = sys.argv[2]

    if len(sys.argv) == 4:
        fps = float(sys.argv[3])
    else:
        fps=1.0

    
    if path.lower().endswith(".jpg"):
        # single file
        file_list = [path]
    else:
        # folder(s)
        file_list = []
        for root, sub_folders, files in os.walk(path):
            file_list += [os.path.join(root, filename) for filename in files if filename.lower().endswith(".jpg")]


    if fps < 1.0:
        time_offset = int(1 / fps)
        delta = 1
        msec = 0
    else:
        time_offset = 1
        delta = int(fps)
        msec = 1000 / delta

    dtd = 0
    inc = 0
    
    file_list.sort()
    start_time_dt = datetime.datetime.strptime(start_time,'%Y-%m-%d %H:%M:%S');
    
    prefix = "mapicam"
    
    for filepath in file_list:

            t = add_exif_using_timestamp(filepath, start_time_dt, inc)
            
            new_file_name = os.path.join(root,
                                "{}-{}_{:03d}.jpg".format(prefix, t.strftime("%Y%m%d_%H%M%S"), (dtd * msec)) )
            if not os.path.isfile(new_file_name) and os.path.isfile(filepath):
                os.rename(filepath,new_file_name)
            
            dtd += 1
            if dtd == delta:
                inc += time_offset
                dtd = 0   
            

   
