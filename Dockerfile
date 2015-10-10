
FROM base/archlinux

MAINTAINER Michel

# setup pacman
RUN pacman-key --populate archlinux && pacman-key --refresh-keys

# install base packages
RUN pacman -Syyu --needed base-devel git --noconfirm

# install yaourt
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/package-query.git && cd package-query && makepkg -si --noconfirm
RUN git clone https://aur.archlinux.org/yaourt.git && cd yaourt && makepkg -si --noconfirm

RUN yaourt -S openturns ipython-ipyparallel python-matplotlib --noconfirm
