#!/usr/bin/env /bin/bash

TEMP_FILE=$(mktemp -d)
build_pkgs = ('jdk21-openjdk' 'git')

install_deps() {
	for pkg in ${build_pkgs[@]}; do
		pacman -Sy --noconfirm $pkg
	done
}

set_git_creds() {
	git config --global user.name 'winlogon'
	git config --global user.email 'winlogon@winlogon.org'
}

clone_cd_repo() {
	git clone https://github.com/PaperMC/Folia.git $TEMP_FILE
	cd $TEMP_FILE
	set_git_creds
}

install_deps
clone_cd_repo
set_git_creds

./gradlew applyPatches
./gradlew createMojmapBundlerJar
