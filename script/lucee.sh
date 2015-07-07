#!/bin/bash -eux

LUCEE_VERSION="4.5.1.000"
LUCEE_INSTALLER="lucee-${LUCEE_VERSION}-pl0-linux-x64-installer.run"

if [ ! -f /tmp/${LUCEE_INSTALLER} ]; then
  echo '==> Downloading Lucee'
  wget -O /tmp/${LUCEE_INSTALLER} http://railo.viviotech.net/downloader.cfm/id/133/file/${LUCEE_INSTALLER} 2>&1
fi

chmod +x /tmp/${LUCEE_INSTALLER}
echo '==> Running installer in unattended mode...'
/tmp/${LUCEE_INSTALLER} --mode unattended --installconn false --installiis false --railopass password
