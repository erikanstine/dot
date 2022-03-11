#!/bin/bash
# Plaid specific env variables/aliases

export PATH="$HOME/plaid/go.git/bin:$PATH"
export PLAID_PATH=/Users/eanstine/plaid
export PLAID_ENV=devenv
export GOPRIVATE=github.plaid.com
export KRAKEN_URL='https://kraken.util.ue1.quovo.com/'

# PDCLI-GO
export PDAAS="/Users/eanstine/plaid/pdaas/"
export PDCLI="/Users/eanstine/plaid/pdaas/build/pd2/scripts/cli"
alias pdcli='cd ${PDAAS} && ./pdcli.sh '
alias pdcli-build='cd ${PDAAS} && git pull origin master && nvm use && make setup && make build'
alias pdcli-debug='cd ${PDAAS} && node --inspect ${PDCLI}'
alias pdcli-go='cd ${PDAAS} && pdcli-build && pdcli'

alias rdocker='env \
    DOCKER_TLS_VERIFY="1" \
    DOCKER_HOST="tcp://eanstine.devenv.plaid.io:2376" \
    DOCKER_CERT_PATH="/Users/eanstine/plaid/go.git/resources/development-certs/remote_devenv_certs" \
    docker'

# reset pdaas
alias rpd="./devenv service stop pdaas && ./devenv service build pdaas && ./devenv service start pdaas"

# edit link_web_client env file
alias lwc_update=sed -i '' "/^#[A-Z]/s/#//g; s/{LDAP_USERNAME}/$USER/g" $PLAID_PATH/link-web-client/environment/development
