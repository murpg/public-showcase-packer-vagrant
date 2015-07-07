#!/bin/bash -eux

echo '==> Applying slow DNS fix'
if [[ "${PACKER_BUILDER_TYPE}" =~ "virtualbox" ]]; then
  echo 'RES_OPTIONS="single-request-reopen"' >> /etc/sysconfig/network
  service network restart
  echo '==> Slow DNS fix applied (single-request-reopen)'
else
  echo '==> Slow DNS fix not required for this platform, skipping'
fi
