CentOS7 Hardened Packer Builder
================

Builds CentOS7 AMIs that are hardened according to CIS recommendations, free
of marketplace restrictions.

It does a CIS hardening appropriate as a starting point. It does not set up
central authentication or centralized syslogging for you.

This script supports both VirtualBox (OVF) and AWS.

Trusted Certificates
------------------
Specify certificates in `local/trusted-certs`, which will be automatically
added to the trust anchors. Certificates must be placed in individual files with
the `.pem` extension.

AWS Notes
------------------

It is easiest to build for AWS from an EC2 instance with an appropriate IAM
role. However, you can build from anywhere by specifying an access and secret
key. To avoid marketplace restrictions, the AWS instance is built in a chroot
jail. Therefore, you need to use a CentOS7 instance to provision from.

To build for AWS:

```packer build -only=amazon-chroot packer-centos7-hardened.json```


VirtualBox Notes
------------------

**Experimental / Incomplete**

Building for VirtualBox will create a VM template initially configured for
DHCP. To build for VirtualBox, you will need to have VirtualBox pre-installed.
A default kickstart is included and will be made available to the vbox instance
for download. If customizing the kickstart, you must specify a root password
that matches the password in the packer config.

To build for VirtualBox:

```packer build -only=virtualbox-iso packer-centos7-hardened.json```

Acknowledgments
------------------

This project borrows from the [packer-centos7-chroot](https://github.com/shepdelacreme/packer-centos7-chroot)
project as a starting point for a baseline centos7 ami.

It depends on [ansible-centos7-cis](https://github.com/rhythmictech/ansible-centos7-cis),
which was forked from the original repo at https://github.com/MindPointGroup/RHEL7-CIS and
lightly modified.
