
FROM base/archlinux

MAINTAINER Michel

# setup keyring
RUN pacman-key --populate archlinux && pacman-key --refresh-keys

# add yaourt repo
RUN echo '[archlinuxfr]' >> /etc/pacman.conf && echo 'SigLevel = Never' >> /etc/pacman.conf && echo 'Server = http://repo.archlinux.fr/$arch' >> /etc/pacman.conf

# install base packages
RUN pacman -Syu --needed base-devel git yaourt --noconfirm
RUN pacman-db-upgrade

# makepkg config
RUN cd /usr/bin && curl -O https://aur.archlinux.org/cgit/aur.git/plain/makepkg-asroot.patch?h=makepkg-asroot && patch -p0 -i makepkg-asroot.patch?h=makepkg-asroot && cd -
RUN sed -i 's|#MAKEFLAGS="-j2"|MAKEFLAGS="-j4"|g' /etc/makepkg.conf

# install packages
RUN yaourt -Syu openturns python-matplotlib jupyter --aur --noconfirm
