#!/usr/bin/env sh

TARGET_FOLDER="${HOME}/sdk"

if [ ! -d "${TARGET_FOLDER}" ]; then
  mkdir -p ${TARGET_FOLDER}
fi

function install_openjdk() {
  local version=${1}
  local name=${2}
  local url=${3}

  local target_tar="${version}.tar.gz"

  echo "Installing ${version}"

  wget -O /tmp/${target_tar} ${url}

  if [ -d ${TARGET_FOLDER}/${name}/ ]; then
    rm -rf ${TARGET_FOLDER}/${name}/
  fi

  tar -xf /tmp/${target_tar} -C ${TARGET_FOLDER}/

  if which jenv >/dev/null 2>&1; then
    yes | jenv add "${TARGET_FOLDER}/${name}/Contents/Home/"
    jenv rehash
  fi
  echo "Finished"
}

install_openjdk "openjdk64-10.0.1" "jdk-10.0.1.jdk" "https://download.java.net/java/GA/jdk10/10.0.1/fb4372174a714e6b8c52526dc134031e/10/openjdk-10.0.1_osx-x64_bin.tar.gz"

