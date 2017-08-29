#!/bin/sh

MD5="md5sum"

get() {
  local FILE=$1
  local FILE_NAME

  FILENAME=`basename ${FILE}`

  [ -s "${FILENAME}" ]  && echo "Skipping ${FILENAME}" && return 1

  echo "Retrieving ${FILE}..."
  wget ${FILE}

  return $?
}


checksum() {
  MD5="md5"
  ${MD5} software/*/* > md5.txt
  cat md5.txt

  return 0
}


main() {
  echo "Getting VirtualBox images from https://www.virtualbox.org/wiki/Downloads"
  echo "Getting Vagrant images from https://www.vagrantup.com/downloads.html"

  mkdir -p software/{mac,win,linux}
  cd software
  
  cd win
  get http://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-Win.exe
  get https://releases.hashicorp.com/vagrant/1.9.8/vagrant_1.9.8_x86_64.msi
  cd ..

  cd mac
  get http://download.virtualbox.org/virtualbox/5.1.26/VirtualBox-5.1.26-117224-OSX.dmg
  get https://releases.hashicorp.com/vagrant/1.9.8/vagrant_1.9.8_x86_64.dmg
  cd ..


  cd ..  # back to script basedir

  mkdir -p boxes
  cd boxes
  echo "Getting latest vargant box images for local source"
  rsync -a ~/.vagrant.d/boxes/centos-VAGRANTSLASH-6 .
  rsync -a ~/.vagrant.d/boxes/centos-VAGRANTSLASH-7 .
  rsync -a ~/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-xenial64 .
  cd ..  # back to script basedir

  checksum
}

main $*
exit $?
