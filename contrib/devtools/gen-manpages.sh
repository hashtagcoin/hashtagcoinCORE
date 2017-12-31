#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

HASHTAGCOIND=${HASHTAGCOIND:-$SRCDIR/hashtagcoind}
HASHTAGCOINCLI=${HASHTAGCOINCLI:-$SRCDIR/hashtagcoin-cli}
HASHTAGCOINTX=${HASHTAGCOINTX:-$SRCDIR/hashtagcoin-tx}
HASHTAGCOINQT=${HASHTAGCOINQT:-$SRCDIR/qt/hashtagcoin-qt}

[ ! -x $HASHTAGCOIND ] && echo "$HASHTAGCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
HASHVER=($($HASHTAGCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for hashtagcoind if --version-string is not set,
# but has different outcomes for hashtagcoin-qt and hashtagcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$HASHTAGCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $HASHTAGCOIND $HASHTAGCOINCLI $HASHTAGCOINTX $HASHTAGCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${HASHVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${HASHVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
