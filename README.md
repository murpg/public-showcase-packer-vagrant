# Showcase Packer-Vagrant

This repository contains a link to a template for CentOS 7.1 and Lucee that can create Vagrant boxes
using the Hasicorp provisioner Packer.

## Building the Vagrant boxes

To build the boxes, you will need Packer and the virtualization software VirtualBox,
VMWare Workstation or VMware Fusion installed. You can build only specific build types
by using `-only` parameter, e.g.:

```shell
# build only for virtualbox
$ packer build -only=virtualbox-iso centos71.json
...
# build only for vmware
$ packer build -only=vmware-iso centos71.json
...
```

> **NOTE** To enable detailed logging, set the `VAGRANT_LOG` or `PACKER_LOG`
> environment variables, e.g.:
>
> ```shell
> $ PACKER_LOG=debug packer build <config.json>
> ...
> $ VAGRANT_LOG=debug vagrant up
> ```

### Caching of installation files

To speed up the creation of the Vagrant boxes the following files should be
copied into the project root folder

| URL to download                                                                                   | File name                                 |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------- |
| http://mirrors.sonic.net/centos/7.1.1503/isos/x86_64/CentOS-7-x86_64-DVD-1503-01.iso              | centos7-local.iso                           |
| http://railo.viviotech.net/downloader.cfm/id/133/file/lucee-4.5.1.000-pl0-linux-x64-installer.run | lucee-4.5.1.000-pl0-linux-x64-installer.run |

## Using generated boxes in Vagrant

After you build the boxes you can use the `vagrant box add` command to add generated
boxes to Vagrant. The generated boxes are stored in the `box` folder. You can
use the same name for virtualbox and vmware provider, because Vagrant is
smart enough to distinguish between different providers with the
same names.

```shell
# add vagrant box for virtualbox provider
$ vagrant box add --name=centos71 box/virtualbox/centos71-0.1.0.box
...
# add vagrant box for vmware provider
$ vagrant box add --name=centos71 box/vmware/centos71-0.1.0.box
```

## Running Vagrant

After adding the generated box to Vagrant, you can simply type

```shell
$ vagrant up
```

and go to `http://lucee.dev.com:8888`. Server and Web password is `password`.
