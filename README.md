Running MicroK8s on some ARM hardware may run into difficulties because cgroups (required!) are not enabled by default. This can be remedied on the Rasberry Pi by editing the boot parameters:

sudo vi /boot/firmware/cmdline.txt

Note: In some Raspberry Pi Linux distributions the boot parameters are in `/boot/firmware/nobtcmd.txt`.

And adding the following:

cgroup_enable=memory cgroup_memory=1
