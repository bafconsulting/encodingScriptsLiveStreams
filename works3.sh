ffmpeg -i rtsp://192.168.1.10:554/user=admin&password=&channel=1&stream=0.sdp? -vcodec copy -acodec copy -f rtmp://a.rtmp.youtube.com/live2/key
