FROM i386/ubuntu

RUN apt-get update
RUN apt-get install -y libssl1.0.0
RUN apt-get install -y libqtwebkit4
RUN apt-get install -y libqt4-scripttools
RUN apt-get install -y sudo
RUN apt-get install -y xorg openbox

ENV USERNAME luqui
RUN useradd -m $USERNAME && \
    echo "$USERNAME:$USERNAME" | chpasswd && \
    usermod --shell /bin/bash $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    # Replace 1000 with your user/group id
    usermod  --uid 1000 $USERNAME && \
    groupmod --gid 1000 $USERNAME

USER luqui
ENV HOME /home/luqui

RUN export QT_X11_NO_MITSHM=1

COPY pt /opt/pt

WORKDIR /opt/pt/bin

CMD ./PacketTracer6
