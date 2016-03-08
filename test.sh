 #!/bin/bash  
 urllocal="rtmp://localhost/myapp/mystream"  
 fifo="live.fifo.h264"  
 rm -f "$fifo"  
 mkfifo "$fifo" 
 
 #this uses the patched version of raspivid with infinite time and -g option  
 raspivid \  
  -fps 25 -g 100 \  
  -t 0 -b 500000 -o "$fifo" & 
 
 ffmpeg -y \  
  -f h264 \  
  -i "$fifo" \  
  -c:v copy \  
  -map 0:0 \  
  -f flv "$urllocal"