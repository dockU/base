FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Syu --noconfirm --needed screen vim-minimal

RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN /usr/bin/useradd -m -d /home/jchen jchen
ADD https://github.com/fly.keys /home/jchen/.ssh/authorized_keys
RUN passwd -d jchen
RUN chown -R jchen:jchen /home/jchen

ENV HOME /home/jchen
