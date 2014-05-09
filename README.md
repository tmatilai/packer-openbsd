# OpenBSD Packer Templates

This repository contains templates for building OpenBSD boxes for
[Vagrant](http://www.vagrantup.com) using [Packer](http://packer.io).

Pre-built boxes can be installed via [Vagrant Cloud](https://vagrantcloud.com):

```
vagrant box add tmatilai/openbsd-5.4
```

You can also build the boxes yourself:
```
packer build openbsd-<version>.json
```

## License

The templates are based on the [Bento](https://github.com/opscode/bento)
project and [Veewee](https://github.com/jedi4ever/veewee) templates.

Copyright 2014, Teemu Matilainen (<teemu.matilainen@iki.fi>)

Licensed under the Apache License, Version 2.0 (see the [LICENSE](LICENSE)).
