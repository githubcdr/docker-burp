# Linux burp running on Alpine Linux

Minimal burp binary running on Alpine Linux, prepared for use in Kubernetes.

# credits
	
Burp is a network backup and restore program. It attempts to reduce network traffic and the amount of space that is used by each backup. There are two independent backup protocols to choose from:

Protocol 1: Optionally uses librsync.
Available in all burp versions and is stable.

Protocol 2: Uses variable length chunking for inline deduplication, and sparse indexing on the server side.
Available from burp version 2.0.x, but is experimental and should not be used in production.
Burp uses VSS (Volume Shadow Copy Service) to make snapshots when backing up Windows computers.
It is open source free software (where 'free' means both that you do not have to pay for it, and that you have freedom to do what you want with it) released under the AGPLv3 licence. See the LICENCE for more information.

Finally, as with the vast majority of open software, Burp comes with absolutely no warranty. You are responsible for testing it and ensuring that it works for you.

The main author of Burp is Graham Keeling.
Docker image created by https://github.com/githubcdr

# docker

/app contains runtime
/config contains config

# Kubernetes

I use this image on Kubernetes

# source

https://burp.grke.org/
