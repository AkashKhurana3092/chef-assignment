##### For RHEL ######

default['mongodb']['baseurl'] = 'https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.4/x86_64/'
default['mongodb']['gpgkey'] = 'https://www.mongodb.org/static/pgp/server-4.4.asc'
default['mongodb']['package'] = 'mongodb-org'

##### For Ubuntu ######

default['mongodb']['key'] = 'https://www.mongodb.org/static/pgp/server-3.2.asc'
default['mongodb']['keyserver'] = 'hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5'
default['mongodb']['repo'] = 'http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse'
default['mongodb']['source'] = '/etc/apt/sources.list.d/mongodb-org-3.2.list'