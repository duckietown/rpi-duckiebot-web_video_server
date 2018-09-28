# Base image
FROM duckietown/rpi-duckiebot-base:master18

ENV WEB_VIDEO_SERVER_PORT=8001
EXPOSE 8001/tcp

# enable ARM
RUN [ "cross-build-start" ]


RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y ros-kinetic-web-video-server

# install ENTRYPOINT script
ADD assets/* /root/
RUN chmod +x /root/entrypoint_web_server.sh


# disable ARM
RUN [ "cross-build-end" ]

# configure ENTRYPOINT
ENTRYPOINT ["/ros_entrypoint.sh", "/root/entrypoint_web_server.sh"]
