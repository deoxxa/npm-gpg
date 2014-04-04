#!/bin/sh

error() {
  echo $1
  exit 1
}

[ -e manifest ] && error "please remove current manifest file"

TARFILE=$( npm pack | tail -n 1 )

[ -e ${TARFILE} ] || error "there was a problem packing the project"

tar -tf ${TARFILE} | while read f; do
  f=${f#package/}

  [ -e ${f} ] || continue

  echo ${f}
done | sort | xargs shasum | gpg --clearsign -a -o manifest -

rm ${TARFILE}
