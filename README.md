# Showcase Packer-Vagrant

This repository contains template for CentOS 7.1 that can create Vagrant boxes
with Lucee using Packer.

## Building the Vagrant boxes

To build the boxes, you will need Packer and virtualization software VirtualBox,
VMWare Workstation or Fusion installed. You can build only specific build types
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

After you built the boxes you can use `vagrant box add` command to add generated
box to the Vagrant. The generated boxes are stored under `box` folder. You can
use the same name for virtualbox and vmware provider, because the Vagrant is
smart enough about being able to distinguish between different providers with
same names.

```shell
# add vagrant box for virtualbox provider
$ vagrant box add --name=centos71 box/virtualbox/centos71-0.1.0.box
...
# add vagrant box for vmware provider
$ vagrant box add --name=centos71 box/vmware/centos71-0.1.0.box
```

## Running Vagrant

After adding the box into the Vagrant, you can simply type

```shell
$ vagrant up
```

and go to `http://localhost:8080`. Server and Web password is `password`.
