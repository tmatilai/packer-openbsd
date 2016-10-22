# OpenBSD Packer Templates

This repository contains templates for building OpenBSD boxes for
[Vagrant](http://www.vagrantup.com) using [Packer](http://packer.io).
Supports VirtualBox, VMware, and QEMU/libvirt providers.

Pre-built boxes can be installed via [Hashicorp Atlas](https://atlas.hashicorp.com/search?q=ryanmaclean%2Fopenbsd):

Current:

```
vagrant box add ryanmaclean/openbsd-6.0
```

Older:

```
vagrant box add ryanmaclean/openbsd-5.9
```

You can also build the boxes yourself:
```
packer build openbsd-<version>.json
```

The boxes won't include VirtualBox Guest Additions nor VMware Tool
(as they are not available for the OS). So for synced folders you need to use
e.g. [NFS](https://docs.vagrantup.com/v2/synced-folders/nfs) or
[rsync](https://docs.vagrantup.com/v2/synced-folders/rsync).

## Chef and Ansible Support

The images created by this script currently support Chef and/or Ansible installation at build time. 

### Chef
In order to have Chef installed in the Vagrant box, set `chef_version` (line 3) to either `prerelease` or `latest` in the json file for the version you are building. 

### Ansible
In order to have Ansible installed in the Vagrant box, set `vagrant_ansible` (line 8) to `yes` in the json file for your build. 

## License

The templates are based on the [Bento](https://github.com/opscode/bento)
project and [Veewee](https://github.com/jedi4ever/veewee) templates.

Copyright 2014-2015, Teemu Matilainen (<teemu.matilainen@iki.fi>)

Licensed under the Apache License, Version 2.0 (see the [LICENSE](LICENSE)).
