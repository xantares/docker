
FROM base/archlinux

MAINTAINER Michel

# setup keyring
RUN pacman-key --populate archlinux && pacman-key --refresh-keys

# add yaourt repo
RUN echo '[archlinuxfr]' >> /etc/pacman.conf && echo 'SigLevel = Never' >> /etc/pacman.conf && echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf

# install base packages
RUN pacman -Syyu --needed base-devel git yaourt --noconfirm

RUN yaourt -Syu openturns ipython-ipyparallel python-matplotlib --noconfirm
