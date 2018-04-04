# Vagrant-Ansible-Hyrax

A simplistic Vagrant dev environment for hacking on Hyrax, and do so with Ansible for provisioning. Uses [Librarian-Ansible](https://github.com/bcoe/librarian-ansible) to handle downloading Ansible roles.

Need more roles? Add them to the Ansiblefile. Call them in the playbook.

This is totally a work in progress, use at your own risk.

## How to use

Standard Vagrant protocol: clone this repository, cd to the root of it, and run

```
vagrant up
```

## Vagrant Plugin Recommendations

Vagrant has a robust community of plugin developers, and some of the plugins are quite nice. [Installing a Vagrant plugin](https://www.vagrantup.com/docs/plugins/usage.html) is simple.

The following Vagrant plugin is *required*, if you use the default [ubuntu/xenial](https://app.vagrantup.com/ubuntu/boxes/xenial64) base box (in other words, if you don't change the default, you'll *need* this plugin).

* [Vagrant-Disksize](https://github.com/sprotheroe/vagrant-disksize) - may not be required if you use another base box, but it's handy if you ever do end up using the ubuntu/xenial base box (it's too tiny to be usable for much of anything).

The following Vagrant plugins are not required, but they do make using Vagrant more enjoyable.

* [Vagrant-VBGuest](https://github.com/dotless-de/vagrant-vbguest) - *Highly Recommended for VirtualBox* as it keeps VirtualBox Guest Additions up to date
  * `vagrant plugin install vagrant-vbguest`
* [Vagrant-Cachier](https://github.com/fgrehm/vagrant-cachier) - Caches packages between VMs. (Project now unmaintained, see URL)
* [Vagrant-Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
* [Vagrant-Proxyconf](https://github.com/tmatilai/vagrant-proxyconf/)
* [Vagrant-VBox-Snapshot](https://github.com/dergachev/vagrant-vbox-snapshot/)
* [Vagrant-Notify](https://github.com/fgrehm/vagrant-notify)


## Attribution

I've borrowed freely from the following projects:

* [Vagrant-DSpace](http://github.com/dspace/vagrant-dspace) (a bunch of shell provisioners)
* [Double-p/smtf-test](https://github.com/double-p/smtf-test) (inspiration for the Ansible Local provisioner layout)
* [Geerlingguy's Ansible-Vagrant Examples](https://github.com/geerlingguy/ansible-vagrant-examples)

This project leverages the work of my colleague [Kevin S. Clarke](https://github.com/ksclarke) and in particular his [Packer-Samvera](https://github.com/ksclarke/packer-samvera) project. Both this project and Kevin's levarage the work of [Digital Curation Experts](https://github.com/curationexperts) and in particular their [Ansible-Samvera roles](https://github.com/curationexperts/ansible-samvera). Thanks to everyone who shares their work with the community!


## License

[MIT](https://github.com/hardyoyo/vagrant-ansible-hyrax/blob/master/LICENSE)
