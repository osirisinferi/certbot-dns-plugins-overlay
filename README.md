
# OsirisInferis overlay for the DNS plugins of the ACME client [certbot](https://github.com/certbot/certbot/)

## Description

Currently, the only certbot DNS plugin in the official Gentoo Portage tree is [certbot-dns-nsone](https://packages.gentoo.org/packages/app-crypt/certbot-dns-nsone). This overlay contains unofficial ebuilds for *all* the other DNS plugins in the certbot repository. Not anything fancy really, just that one official ebuild modified to include the correct dependencies.

Note: the working of the plugins (besides certbot-dns-rfc2136) is NOT garanteed, as I don't have any means to test them at all.

## Instructions

### Recommended method

This method is for systems using [app-eselect/eselect-repository](https://packages.gentoo.org/packages/app-eselect/eselect-repository) for the management of their overlays. For the [layman](https://wiki.gentoo.org/wiki/Layman) method or if you want to add the overlay completely manually, see below.

If not installed already, install `app-eselect/eselect-repository`:

```
emerge -av app-eselect/eselect-repository
```

Next, enable the overlay:

```
eselect repository enable certbot-dns-plugins
```

Note: if the overlay cannot be found, it hasn't propogated properly to the mirror XML yet. This should happen within a few days. In the mean time, you can make `eselect` use the original Gentoo list:

```
vim /etc/eselect/repository.conf
```

and comment out the currently active `REMOTE_LIST_URI` with the `qa-reports.gentoo.org` hostname and uncomment the currently commented `REMOTE_LIST_URI` line with the `api.gentoo.org` hostname. Save, exit `vim` and delete the cached XML file with `rm ~/.cache/eselect-repo/repositories.xml`. Afterwards, run the above `eselect` command again.

After the overlay has been enabled, it isn't downloaded yet. To download all the ebuilds, sync the overlay by running:

```
emerge --sync certbot-dns-plugins
```

After the overlay has been synced, you can emerge any of the 13 certbot DNS plugins currently not in the official Gentoo Portage tree.

Note: all ebuilds have the *testing* KEYWORDS variable set, including potential dependencies. Please add the appropriate keyword when trying to install any of the ebuilds.

### Alternative methods

#### Layman

If you're using `layman` for managing your overlays, you can simply run:

```
layman -a certbot-dns-plugins
```

Note: layman uses the original Gentoo overlay list by default. If you manually changed this to the mirror XML, it might be that the `certbot-dns-plugins` overlay hasn't propogated to that mirror list yet. If this is the case, please edit `/etc/layman/layman.cfg` to use `https://api.gentoo.org/overlays/repositories.xml` in the `overlays` option and try again.

After layman automatically has synced the overlay, it can be used immediately.

Note: all ebuilds have the *testing* KEYWORDS variable set, including potential dependencies. Please add the appropriate keyword when trying to install any of the ebuilds.

#### Manual installation of the repository without `eselect repository` or `layman`

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
ln -s /var/db/repos/certbot-dns-plugins-overlay/certbot-dns-plugins.conf /etc/portage/repos.conf/
```

Note: `repos.conf` can also be a file, but a directory is prefered according to [the Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Portage/Files#Gentoo_ebuild_repository).

See for more information: https://wiki.gentoo.org/wiki//etc/portage/repos.conf

Note: all ebuilds have the *testing* KEYWORDS variable set, including potential dependencies. Please add the appropriate keyword when trying to install any of the ebuilds.
