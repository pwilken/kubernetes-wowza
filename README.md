# Wowza Streaming Engine in a Kubernetes Cluster

## Streamlock
If you want to secure your RTMP (RTMPS) and HLS connection via SSL, you can use the Streamlock function of Wowza.

You have to put your streamlock file "xyz.streamlock.net.jks" in this folder for copying it in the Dockerfile.

Important: the certificate name is your hostname for HLS, for RTMPS you will use <your-kubernetes-cluster-ip>:<service-port> 

https://www.wowza.com/docs/how-to-get-ssl-certificates-from-the-streamlock-service

## Application.xml
Edit this file for your application settings. The following setting is for defining your content path.

```
<StorageDir>${com.wowza.wms.context.VHostConfigHome}/data/content</StorageDir>
```

## VHost.xml
Edit this file for your Host-Settings. The following setting is to define your Streamlock certificate.

```
<SSLConfig>
    <KeyStorePath>${com.wowza.wms.context.VHostConfigHome}/conf/xyz.streamlock.net.jks</KeyStorePath>
    <KeyStorePassword>your-streamlock-passwort</KeyStorePassword>
</SSLConfig>
```

### Examples
HLS Stream (Output): https://xyz.streamlock.net:service-port/live/test/playlist.m3u8?DVR

?DVR is for playback (nDVR is enabled in the Application.xml)

```
RTMPS Stream (Input): ffmpeg -i rtsp://ip:1935/stream1 -vcodec libx264 -acodec aac -r 25 -ar 22050 -g 10 -strict experimental -f flv rtmps://kubernetes-cluster-ip:service-port/live/test
```
