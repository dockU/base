FROM docku/sshd
MAINTAINER Jon Chen <docku@burrito.sh>

RUN pacman -Syu --noconfirm --needed screen vim-minimal

VOLUME ["/etc/localtime"]

RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN /usr/bin/useradd -m -d /home/jchen jchen
ADD authorized_keys /home/jchen/.ssh/authorized_keys
RUN passwd -d jchen
RUN chown -R jchen:jchen /home/jchen

ENV HOME /home/jchen
