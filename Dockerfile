
FROM base/archlinux

MAINTAINER Michel

RUN pacman -Syyu --needed base-devel git --noconfirm

# install yaourt
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/package-query.git && cd package-query && makepkg -si --asroot --noconfirm
RUN git clone https://aur.archlinux.org/yaourt.git && cd yaourt && makepkg -si --asroot --noconfirm

RUN yaourt -S openturns ipython-ipyparallel python-matplotlib --noconfirm
