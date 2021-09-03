What is FileRun?
==================

[FileRun](https://filerun.com) is a self-hosted Google Drive/Photos/Music alternative. It is a full featured web based file manager with an easy to use user interface.

This is a modified version of the official FileRun docker image, with several changes oriented toward use for photography.  For more info, see the docker hub page at https://hub.docker.com/r/nerdsofparadise/filerun

Installation
==================
See https://docs.filerun.com/docker for the guide.

Default login
==================

This docker image does not have default user credentials.  Unlike the official docker, it does not come with FileRun 'pre-installed'.

The first time the container is run, FileRun will go through its normal installation process, similar to when it is installed on a bare metal server.  For more information on this install process, please see the installation docs at the official FileRun website.


SSL/HTTPS
==================
For SSL/HTTPS support, you would need to use it with a reverse proxy (https://www.digitalocean.com/community/tutorials/how-to-secure-haproxy-with-let-s-encrypt-on-ubuntu-14-04#step-3-%E2%80%94-installing-haproxy).
Make sure your reverse proxy passes `HTTP_X_FORWARDED_PROTO`, or `HTTP_X_FORWARDED_SSL`, or `HTTP_X_FORWARDED_PORT`. FileRun looks for any of these to determine if the URLs should start using HTTP or HTTPS. When using NGINX, just add this line in your conf file, in the `location` block: `proxy_set_header X-Forwarded-Proto https;`


License
==================
See the following document for the [licensing terms](https://goo.gl/wk2FSs).


Documentation
==================
For FileRun documentation, please visit https://docs.filerun.com/
