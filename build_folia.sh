#!/usr/bin/env /bin/bash

pacman -Sy jdk21-openjdk
TEMP_FILE=$(mktemp -d)
git clone https://github.com/PaperMC/Folia.git $TEMP_FILE
cd $TEMP_FILE
git config --global user.name '#84837'
git config --global user.email 'walker84837@gmail.com'
./gradlew applyPatches
./gradlew createReobfBundlerJar