FROM wowzamedia/wowza-streaming-engine-linux

ENV WSE_MGR_USER=user
ENV WSE_MGR_PASS=password

# Uncomment and add your license
# ENV WSE_LIC=

EXPOSE 1935/tcp
EXPOSE 8086/tcp
EXPOSE 8087/tcp
EXPOSE 8088/tcp

# Uncomment and add your streamlock certificate for a SSL Encryption of for example your 1935 Port (HLS, RTMPS)
# COPY ./xyz.streamlock.net.jks /usr/local/WowzaStreamingEngine/conf/xyz.streamlock.net.jks
COPY ./Application.xml /usr/local/WowzaStreamingEngine/conf/live/Application.xml
COPY ./VHost.xml /usr/local/WowzaStreamingEngine/conf/VHost.xml

# VOLUME ["${WOWZA_DATA_DIR}", "${WOWZA_LOG_DIR}"]
CMD ["/sbin/entrypoint.sh"]
