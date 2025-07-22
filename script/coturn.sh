podman run -d --name coturn \
  -p 3478:3478/udp \
  -p 3478:3478/tcp \
  -p 49152-49200:49152-49200/udp \
  instrumentisto/coturn \
  -n \
  --log-file=stdout \
  --lt-cred-mech \
  --realm=turn.webrtc \
  --user=webrtcuser:strongpassword \
  --external-ip=192.168.5.216 \
  #--listening-ip=192.168.5.216

