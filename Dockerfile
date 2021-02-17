FROM cm2network/steamcmd

RUN /home/steam/steamcmd/steamcmd.sh +login anonymous \
    +force_install_dir /home/steam/Valheim +app_update 896660 validate +exit

COPY ./files/custom_start_server.sh /home/steam/Valheim/custom_start_server.sh
USER root
RUN chmod +x /home/steam/Valheim/custom_start_server.sh
USER steam

WORKDIR /home/steam/Valheim

ENV LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
ENV SteamAppId=892970

EXPOSE 2456
EXPOSE 2457
EXPOSE 2458

RUN mkdir -p /home/steam/.config/unity3d/IronGate/Valheim
VOLUME /home/steam/.config/unity3d/IronGate/Valheim

ENV SERVER_NAME="My Valheim Server"
ENV SERVER_PASSWORD="viking123"
ENV SERVER_PORT=2456
ENV SERVER_WORLD="Dedicated"

CMD ["/home/steam/Valheim/custom_start_server.sh"]
