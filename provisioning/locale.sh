#!/bin/bash

VAGRANT_USER=vagrant
BASHRC=/home/$VAGRANT_USER/.bashrc
SHELLFILE=/home/$VAGRANT_USER/.shell
cat <<EOF > $SHELLFILE
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
EOF
if ! { grep -Fq $SHELLFILE $BASHRC; }; then
echo "source $SHELLFILE" >> $BASHRC
fi
source $BASHRC
