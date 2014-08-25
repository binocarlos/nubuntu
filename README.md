nubuntu
========

A bash script to initialize and lockdown a new Ubuntu server.

Based on this [gist](https://gist.github.com/alanstevens/1877257)

## install

```bash
$ wget -qO- https://raw.github.com/binocarlos/nubuntu/master/bootstrap.sh | sudo bash
```

## usage

nubuntu has 3 commands:

 * update - update the system to the latest state
 * adduser - add a sudo user with a public key
 * lockdown - prevent password and root logins

These are typically run in a sequence (as root):

```bash
$ nubuntu update
$ cat ~/mykey.pub | nubuntu adduser bob
$ nubuntu lockdown
```

You should reboot the server after this setup (because apt-get safe-upgrade).

The server now has hostname `myhost`, a user called bob who can sudo and uses the public key and will prevent root logins or password logins

## api

#### `nubuntu update`

Update the system

#### `nubuntu adduser bob [keyfile]`

Create a new sudo user with a public key.

You can either pipe the public key into this step or pass a 2nd argument that is either a local file or a http(s):// url to download the key from.

An example piping the key into a new user:

```bash
$ cat ~/mykey.pub | nubuntu user bob
```

An example passing a file location for the key:

```bash
$ nubuntu user bob ~/bobskey.pub
```

An example passing a HTTP endpoint for the key:

```bash
$ nubuntu user bob https://dl.dropbox.com/s/2sld4rsbhl0o093/authorized_keys?dl=1
```

#### `nubuntu lockdown`

Modify sshd_config to prevent password and root logins

Make sure you can login with your user before running this step

## license

MIT