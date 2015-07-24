# OpenBSD Packer Templates

This repository contains templates for building OpenBSD boxes for
[Vagrant](http://www.vagrantup.com) using [Packer](http://packer.io).
Supports VirtualBox, VMware, and QEMU/libvirt providers.

Pre-built boxes can be installed via [Hashicorp Atlas](https://atlas.hashicorp.com/search?q=tmatilai%2Fopenbsd):
```
vagrant box add tmatilai/openbsd-5.7
vagrant box add tmatilai/openbsd-5.6
vagrant box add tmatilai/openbsd-5.5
vagrant box add tmatilai/openbsd-5.4
```

You can also build the boxes yourself:
```
packer build openbsd-<version>.json
```

The boxes won't include VirtualBox Guest Additions nor VMware Tool
(as they are not available for the OS). So for synced folders you need to use
e.g. [NFS](https://docs.vagrantup.com/v2/synced-folders/nfs) or
[rsync](https://docs.vagrantup.com/v2/synced-folders/rsync).

## License

The templates are based on the [Bento](https://github.com/opscode/bento)
project and [Veewee](https://github.com/jedi4ever/veewee) templates.

Copyright 2014-2015, Teemu Matilainen (<teemu.matilainen@iki.fi>)

Licensed under the Apache License, Version 2.0 (see the [LICENSE](LICENSE)).
