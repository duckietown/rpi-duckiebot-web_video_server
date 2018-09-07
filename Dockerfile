# Base image
FROM duckietown/rpi-duckiebot-base:latest

ENV WEB_VIDEO_SERVER_PORT=8001
EXPOSE 8001/tcp

# enable ARM
RUN [ "cross-build-start" ]

# install ENTRYPOINT script
ADD assets/* /root/
RUN chmod +x /root/entrypoint_web_server.sh


# disable ARM
RUN [ "cross-build-end" ]

# configure ENTRYPOINT
ENTRYPOINT ["/ros_entrypoint.sh", "/root/entrypoint_camera.sh"]
