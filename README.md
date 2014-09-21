docker-php-samples
==================

The samples will be displayed inside a vagrant vm.

The base vm used can be created with [packer-templates](https://github.com/BlackIkeEagle/packer-templates)

create the base box
-------------------

~~~ sh
$ cd packer-templates/archlinux
$ packer-io build archlinux-x86_64.json
$ vagrant box add --name archlinux64 archlinux-x86_64-virtualbox.box
~~~

The above instructions are for ArchLinux, on other distributions the packer binary most likely will be `packer`.
