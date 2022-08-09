
# OsirisInferis overlay for the DNS plugins of the ACME client [certbot](https://github.com/certbot/certbot/)
[![pkgcheck](https://github.com/osirisinferi/certbot-dns-plugins-overlay/workflows/pkgcheck/badge.svg)](https://github.com/osirisinferi/certbot-dns-plugins-overlay/actions?query=workflow%3Apkgcheck)
[![ci](https://github.com/osirisinferi/certbot-dns-plugins-overlay/actions/workflows/ci.yml/badge.svg)](https://github.com/osirisinferi/certbot-dns-plugins-overlay/actions/workflows/ci.yml)

## Description

Currently, the only certbot DNS plugin in the official Gentoo Portage tree is [certbot-dns-nsone](https://packages.gentoo.org/packages/app-crypt/certbot-dns-nsone). This overlay contains unofficial ebuilds for *all* the *other* DNS plugins in the certbot repository.

Note: the working of the plugins (besides certbot-dns-rfc2136) is NOT garanteed, as I don't have any means to test them all.

## Instructions

### Recommended method

This method is for systems using [app-eselect/eselect-repository](https://packages.gentoo.org/packages/app-eselect/eselect-repository) for the management of their overlays. For the [layman](https://wiki.gentoo.org/wiki/Layman) method or if you want to add the overlay completely manually, see below.

If not installed already, install `app-eselect/eselect-repository`:

```
sudo emerge -av app-eselect/eselect-repository
```

Next, enable the overlay:

```
sudo eselect repository enable certbot-dns-plugins
```

After the overlay has been enabled, it isn't downloaded yet. To download all the ebuilds, sync the overlay by running:

```
sudo emerge --sync certbot-dns-plugins
```

After the overlay has been synced, you can emerge any of the 13 certbot DNS plugins currently not in the official Gentoo Portage tree.

Note: all ebuilds have the *testing* KEYWORDS variable set, including potential dependencies from this overlay. Please add the appropriate keyword when trying to install any of the ebuilds.

### Alternative methods

#### Layman

If you're using `layman` for managing your overlays, you can simply run:

```
sudo layman -a certbot-dns-plugins
```

After layman automatically has synced the overlay, it can be used immediately.

Note: all ebuilds have the *testing* KEYWORDS variable set, including potential dependencies from this overlay. Please add the appropriate keyword when trying to install any of the ebuilds.

#### Manual installation of the repository without `eselect repository` or `layman`

First, if not done already, make the directory for the repositories:

```
sudo mkdir -p /var/db/repos
```

Then clone the git repository to the directory made above:

```
cd /var/db/repos/ && sudo git clone https://github.com/osirisinferi/certbot-dns-plugins-overlay.git
```

Lastly, move the repo configuration file to the correct directory:

```
sudo mkdir -p /etc/portage/repos.conf
sudo ln -s /var/db/repos/certbot-dns-plugins-overlay/certbot-dns-plugins.conf /etc/portage/repos.conf/
```

Note: `repos.conf` can also be a file, but a directory is prefered according to [the Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Portage/Files#Gentoo_ebuild_repository).

See for more information: https://wiki.gentoo.org/wiki//etc/portage/repos.conf

Note: all ebuilds have the *testing* KEYWORDS variable set, including potential dependencies from this overlay. Please add the appropriate keyword when trying to install any of the ebuilds.
