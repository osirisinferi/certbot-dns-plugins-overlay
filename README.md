
# OsirisInferis overlay for the DNS plugins of the ACME client [certbot](https://github.com/certbot/certbot/)

#### Description

Currently, the only certbot DNS plugin in the official Gentoo Portage tree is [certbot-dns-nsone](https://packages.gentoo.org/packages/app-crypt/certbot-dns-nsone). This overlay contains unofficial ebuilds for *all* the DNS plugins in the certbot repository. Not anything fancy really, just that one official ebuild modified to include the correct dependencies.

Note: the working of the plugins (besides certbot-dns-rfc2136) is NOT garanteed, as I don't have any means to test them at all.

