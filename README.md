CentOS7 Hardened Packer Builder
================

Builds CentOS7 AMIs that are hardened according to CIS recommendations, free
of marketplace restrictions.

This project borrows from the [packer-centos7-chroot](https://github.com/shepdelacreme/packer-centos7-chroot)
project as a starting point for a baseline centos7 ami.

It does a CIS hardening appropriate as a starting point. It does not set up
central authentication or centralized syslogging for you.

Notes
-----------------------
