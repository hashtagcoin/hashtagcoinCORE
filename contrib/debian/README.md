
Debian
====================
This directory contains files used to package hashtagcoind/hashtagcoin-qt
for Debian-based Linux systems. If you compile hashtagcoind/hashtagcoin-qt yourself, there are some useful files here.

## hashtagcoin: URI support ##


hashtagcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install hashtagcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your hashtagcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/hashtagcoin128.png` to `/usr/share/pixmaps`

hashtagcoin-qt.protocol (KDE)

