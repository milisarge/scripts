ffmpeg -f alsa -ar 44100 -i hw:0 -video_size 1600x900 -framerate 30 -f x11grab -i :0.0 -vcodec libx264 -crf 23 -preset ultrafast capture.mkv
