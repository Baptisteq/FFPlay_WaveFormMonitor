#!/bin/bash

INPUTVIDEO=$(echo "$1" | sed "s/cygdrive\/[a-z]\///" | tr "/" "\\" 2> /dev/null )

# In libavfilter, a filter can have multiple inputs and multiple outputs. To illustrate the sorts of things that are possible, we consider the following filtergraph. 
# Schema
                # [main]
# input --> split ---------------------> overlay --> output
            # |                             ^
            # |[tmp]                  [flip]|
            # +-----> crop --> vflip -------+
            
# -vf syntax: 
# ffmpeg -i INPUT -vf "split [main][tmp]; [tmp] crop=iw:ih/2:0:0, vflip [flip]; [main][flip] overlay=0:H/2" OUTPUT
ffplay -i $INPUTVIDEO -vf "split [main][tmp];
                           [tmp] crop=iw:ih/2:0:0, vflip [flip];
                           [main][flip] overlay=0:H/2" 
                           
# split [main][tmp];  Starting with the single input file. Two segments of the same input file is generated [main] & [tmp]
# [tmp] crop=iw:ih/2:0:0, vflip [flip]; Starting with the [tmp] segment crop filter is applied (divide input heigh by two, starting at zero, result is croped by the half of its height value),
# another filter is applied after the first filter is applied (filters are separated by ",") result segment is called [flip]
# [main][flip] overlay=0:H/2",m last filters overlay the [flip] segment upon the original (untouched) [main] segment


# Filters in the same linear chain are separated by commas
# [segment1] filter1,filter2,filter3[segment1];

# Semi colon specifies end of linear chain and linear chain separator
# [segment1]filter1[segment1];
# [segment1]filter2[segment1];
# [segment1]filter3[segment1];

# There exist so-called source filters that do not have an audio/video input, and sink filters that will not have audio/video output. 