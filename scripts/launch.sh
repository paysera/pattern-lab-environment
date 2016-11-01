#!/usr/bin/env bash

# Config
GIT_BIN_DIRECTORY=/usr/bin
DOCKER_BIN_DIRECTORY=/usr/bin
DOCKER_COMPOSER_BIN_DIRECTORY=/usr/local/bin
PATTERN_LAB_REPOSITORY=https://github.com/pattern-lab/edition-node-gulp.git

# Load local config
if [ -e ".local" ]; then
    source .local
fi

# Functions
cloneRepository() {
    if [[ -d "pattern-lab/src" ]]; then
        rm -rf pattern-lab/src
    fi

    ${GIT_BIN_DIRECTORY}/git clone ${PATTERN_LAB_REPOSITORY} pattern-lab/src
}

# Clone repository
if [[ ! -d "pattern-lab/src" || "${1}" == "update" ]]; then
    cloneRepository
    ${DOCKER_COMPOSER_BIN_DIRECTORY}/docker-compose build --force
fi

# Run
${DOCKER_COMPOSER_BIN_DIRECTORY}/docker-compose up -d
