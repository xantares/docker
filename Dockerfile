
FROM base/archlinux

MAINTAINER Michel

# setup keyring
RUN pacman-key --populate archlinux && pacman-key --refresh-keys

# add yaourt repo
RUN echo '[archlinuxfr]' >> /etc/pacman.conf && echo 'SigLevel = Never' >> /etc/pacman.conf && echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf

# install base packages
RUN pacman -Syu --needed base-devel git yaourt --noconfirm
RUN pacman-db-upgrade

RUN yaourt -Syu openturns ipython-ipyparallel python-matplotlib --aur --noconfirm
