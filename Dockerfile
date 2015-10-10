
FROM base/archlinux

MAINTAINER Michel

# setup keyring
RUN pacman-key --populate archlinux && pacman-key --refresh-keys

RUN echo "[archlinuxfr]" >> /etc/pacman.conf && echo "SigLevel = Never" >> /etc/pacman.conf && echo "http://repo.archlinux.fr/$arch" >> /etc/pacman.conf


# install base packages
#RUN pacman -Syu --needed base-devel git --noconfirm
RUN yaourt -Syu git --devel --aur



# install yaourt
WORKDIR /tmp
RUN git clone https://aur.archlinux.org/package-query.git && cd package-query && makepkg -si --noconfirm
RUN git clone https://aur.archlinux.org/yaourt.git && cd yaourt && makepkg -si --noconfirm

RUN yaourt -S openturns ipython-ipyparallel python-matplotlib --noconfirm
