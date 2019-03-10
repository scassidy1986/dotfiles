#!/usr/bin/env sh

if [ -d "${HOME}/.customfonts" ]; then
  echo "Installing additional fonts"
  fonts_dir="${HOME}/.customfonts/*.ttf"
  for font_filename in ${fonts_dir}; do
    echo "> Installing ${font_filename}"
    cp ${font_filename} ~/Library/Fonts/
  done
fi

