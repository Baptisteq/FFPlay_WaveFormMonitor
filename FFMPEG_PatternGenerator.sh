#!/bin/bash

# Generate Pal bars test pattern with 100% color range in RGB 444 16bits full Range
# ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -frames:v 1 -pix_fmt gbrp16le RGB444p16-Full_pal100bars.dpx

# Generate Pal bars test pattern with 100% color range in RGB 444 10bits full Range
# ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -frames:v 1 -pix_fmt gbrp10be RGB444p10-Full_pal100bars.dpx

# Generate Pal bars test pattern with 100% color range in RGB 444 10bits Legal range (odd output)
# ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -vf scale=in_range=full:out_range=limited -frames:v 1 -pix_fmt gbrp10be RGB444p10-Legal_pal100bars.dpx

# Generate Pal bars test pattern with 100% color range in YUV 444 10bits full Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv444p10le -c:v prores_ks -profile:v 4 -vf "setparams=range=full:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORES444_YUV444p10-Full_pal100bars.mov 
# Generate Pal bars test pattern with 100% color range in YUV 422 10bits full Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv422p10le -c:v prores_ks -profile:v 3 -vf "setparams=range=full:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORESHQ_YUV422p10-Full_pal100bars.mov 

# Generate Pal bars test pattern with 100% color range in YUV 420 10bits full Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv422p10le -c:v prores -profile:v 1 -vf "setparams=range=full:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORESLT_YUV422p10-Full_pal100bars.mov 

# Generate Pal bars test pattern with 100% color range in YUV 420 8bits full Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv422p10le -c:v prores -profile:v 0 -vf "setparams=range=full:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORESproxy_YUV422p10-Full_pal100bars.mov 

# Generate Pal bars test pattern with 100% color range in YUV 444 10bits Legal Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv444p10le -c:v prores_ks -profile:v 4 -vf "setparams=range=limited:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORES444_YUV444p10-Legal_pal100bars.mov 
# Generate Pal bars test pattern with 100% color range in YUV 422 10bits Legal Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv422p10le -c:v prores_ks -profile:v 3 -vf "setparams=range=limited:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORESHQ_YUV422p10-Legal_pal100bars.mov 

# Generate Pal bars test pattern with 100% color range in YUV 420 10bits Legal Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv422p10le -c:v prores -profile:v 1 -vf "setparams=range=limited:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORESLT_YUV422p10-Legal_pal100bars.mov 

# Generate Pal bars test pattern with 100% color range in YUV 420 8bits Legal Range
ffmpeg -f lavfi -i pal100bars=duration=1:size=1920x1080:rate=25 -pix_fmt yuv422p10le -c:v prores -profile:v 0 -vf "setparams=range=limited:field_mode=prog:color_primaries=unknown:color_trc=unknown:colorspace=unknown" PRORESproxy_YUV422p10-Legal_pal100bars.mov 
