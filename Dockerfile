
FROM base/archlinux

MAINTAINER Michel

RUN echo 'Server = http://ftp.uni-hannover.de/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN pacman -Syyu --needed base-devel --noconfirm


