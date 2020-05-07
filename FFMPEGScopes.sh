#!/bin/bash


INPUTVIDEO=$(echo "$1" | sed "s/cygdrive\/[a-z]\///" | tr "/" "\\" 2> /dev/null )

# ffplay $INPUTVIDEO -vf waveform=filter=chroma:d=parade:scale=digital:graticule=invert:flags=numbers+dots

# ffplay -i "$INPUTVIDEO" -vf "format=yuv422p10,split=4[a][b][c][d],[a]waveform=filter=lowpass:graticule=invert:scale=digital:flags=numbers+dots[aa],[b][aa]vstack[V],[c]waveform=m=0[cc],[d]vectorscope=color3:g=green[dd],[cc][dd]vstack[V2],[V][V2]hstack"
# ffplay -i "$INPUTVIDEO" -vf "format=yuv422p10,split=4[a][b][c][d],[a]waveform=filter=lowpass:graticule=invert:scale=digital:flags=numbers+dots[aa],[b][aa]vstack[V],[c]waveform=m=0[cc],[d]vectorscope=color3:g=green[dd],[cc][dd]vstack[V2],[V][V2]hstack"

# VFSCALE="scale=960:540"
# VECTORSCOPE="vectorscope=b=0.7:m=color3:g=green"
# PREVIEW="scale=960:540"
# WAVEFORM="waveform=filter=lowpass:graticule=invert:scale=digital:flags=numbers+dots"
# CIESCOPE="ciescope=system=rec709:s=512"
# ffplay "$INPUTVIDEO" -vf "format=yuv444p,
                          # split=5[m][v][p][w][c],
                          # [v]$VECTORSCOPE,$VFSCALE[v],
                          # [m][v]overlay=x=W-w:y=H-h[v1],
                          # [p]$PREVIEW[p],
                          # [v1][p]overlay=x=0:y=0[v2],
                          # [w]$WAVEFORM,$VFSCALE[w],
                          # [v2][w]overlay=x=0:y=H-h[v3],
                          # [c]$CIESCOPE,$VFSCALE[c],
                          # [v3][c]overlay=x=W-w:y=0"


# ffplay "$INPUTVIDEO" -vf "split=4 [UL][UR][LL][LR];
                          # [UR]waveform=filter=lowpass:graticule=invert:display=parade:scale=digital:flags=numbers+dots:i=0.4:components=7:display=parade,scale=960:540[UR]; 
                          # [UL]scale=960:540:force_original_aspect_ratio=decrease,pad=960:540:(ow-iw)/2:(oh-ih)/2 [UL];                                                    
                          # [LL]waveform=filter=lowpass:graticule=invert:display=parade:scale=digital:flags=numbers+dots:i=0.4,scale=960:540[LL];
                          # [LR]ciescope=system=rec709:gamuts=rec2020:s=512,scale=960:540:force_original_aspect_ratio=decrease,pad=960:540:(ow-iw)/2:(oh-ih)/2 [LR];
                          # [UL][UR]hstack[top];
                          # [LL][LR]hstack[bottom];
                          # [top][bottom]vstack,scale=1920x1080"

ffplay "$INPUTVIDEO" -vf "scale=960:540:force_original_aspect_ratio=decrease,split=4 [UL][UR][LL][LR];
                          [UL]pad=960:540:(ow-iw)/2:(oh-ih)/2[UL]; 
                          [UR]format=yuv444p10le ,waveform=filter=lowpass:graticule=invert:display=parade:scale=digital:flags=numbers+dots:i=0.4:components=7:display=parade,scale=960:540[UR];                                                                              
                          [LL]format=yuv444p10le ,waveform=filter=lowpass:graticule=invert:display=parade:scale=digital:flags=numbers+dots:i=0.4,scale=960:540[LL];
                          [LR]format=yuv444p10le ,ciescope=system=rec709:gamuts=rec2020:s=512,scale=960:540:force_original_aspect_ratio=decrease,pad=960:540:(ow-iw)/2:(oh-ih)/2[LR];
                          [UL][UR]hstack[top];
                          [LL][LR]hstack[bottom];
                          [top][bottom]vstack,scale=1920x1080"
                                     

# [UR]format=gbrp,waveform=filter=lowpass:graticule=invert:display=parade:scale=digital:flags=numbers+dots:i=0.2:components=7:display=parade,scale=960:540[UR]; 


# ffplay -i $INPUTVIDEO -i $INPUTVIDEO -filter_complex "[0]crop=iw/2:ih:0:0[left]; [1]crop=iw/2:ih:iw/2:0[right]; [left][right]hstack"

# ffmpeg -f lavfi -i yuvtestsrc=duration=10:size=1920x1080:rate=12 -pix_fmt yuv422p10 yuvtestsrc.mov 

# ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -c:v prores -profile:v 3 -pix_fmt yuv422p10 pal100bars.mov
# ffmpeg -f lavfi -i pal75bars=duration=1:size=1920x1080:rate=25 -c:v prores -profile:v 3 -pix_fmt yuv422p10 pal100bars.mov
# ffmpeg -f lavfi -i rgbtstsrc=duration=1:size=1920x1080:rate=25 -c:v prores -profile:v 3 -pix_fmt yuv422p10 pal100bars.mov




# En bas a gauche (x=W-w nombre de colonne de la fen^tre principal,y=H-h, nombre de ligne de la fêntre principale moins nombre de ligne de la fenêtre à superposer
# overlay=x=W-w:y=H-h (lower right)
# overlay=x=0:y=0 (upper left)
# overlay=x=W-w:y=0 (upper right
# overlay=x=0:y=H-h (lower left)

