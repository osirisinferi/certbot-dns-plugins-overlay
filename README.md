
# OsirisInferis overlay for the DNS plugins of the ACME client [certbot](https://github.com/certbot/certbot/)

#### Description

Currently, the only certbot DNS plugin in the official Gentoo Portage tree is [certbot-dns-nsone](https://packages.gentoo.org/packages/app-crypt/certbot-dns-nsone). This overlay contains unofficial ebuilds for *all* the DNS plugins in the certbot repository. Not anything fancy really, just that one official ebuild modified to include the correct dependencies.

Note: the working of the plugins (besides certbot-dns-rfc2136) is NOT garanteed, as I don't have any means to test them at all.

#### Instructions

First, if not done already, make the directory for the repositories:

```
mkdir -p /var/db/repos
```

Then clone the git repository to the directory made above:

```
cd /var/db/repos/ && git clone https://github.com/osirisinferi/certbot-dns-plugins-overlay.git
```

Lastly, move the repo configuration file to the correct directory:

```
mkdir -p /etc/portage/repos.conf
mv /var/db/repos/certbot-dns-plugins-overlay/certbot-dns-plugins.conf /etc/portage/repos.conf/
```

Note: `repos.conf` can also be a file, but a directory is prefered according to [the Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Portage/Files#Gentoo_ebuild_repository).

See for more information: https://wiki.gentoo.org/wiki//etc/portage/repos.conf
