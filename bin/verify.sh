#!/bin/sh

error() {
  echo $1
  echo
  exit 1
}

echo

[ -e manifest ] || error "no manifest found"

gpg --verify manifest || error "error verifying manifest signature"
echo

grep -E '^[a-f0-9]{40}  ' manifest | while read l; do
  file_hash=$( echo "${l}" | awk '{print $1}' )
  file_name=$( echo "${l}" | awk '{print $2}' )

  printf "%s ... " "${file_name}"

  our_hash=$( shasum ${file_name} | awk '{print $1}' )

  if [ "${our_hash}" = "${file_hash}" ]; then
    echo "good"
  else
    echo "bad"

    echo
    error "checksum failed"
  fi
done

echo
echo "everything is happy!"
echo
