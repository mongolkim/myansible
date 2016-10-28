class mariadb{
	package{'mariadb':
		provider=>yum,
		ensure=>present,
	}

	package{'mariadb-server':
		provider=>yum,
		ensure=>present,
	}
#	package{'mariadb-galera-server':
#                provider=>yum,
#                ensure=>present,
#        }
	
#	package{'mariadb-galera-common':
#                provider=>yum,
#                ensure=>present,
#        }

#	package{'galera':
#                provider=>yum,
#                ensure=>present,
#        }

#	package{'rsync':
#                provider=>yum,
#                ensure=>present,
#        }
	
	file{"/etc/my.cnf.d/mariadb-server.cnf":
		owner=>"root",
		group=>"root",
		mode=>"644",
		source=>"puppet://$puppetserver/modules/mariadb/mariadb-server.cnf",
	}~>


	service{"mariadb":
		enable=>true,
		ensure=>true,
		
	}

	
#	exec{"mariadb":
#		command=>"/usr/libexec/mysqld --wsrep-new-cluster --user=root&",
#		path   =>"/usr/bin:/use/sbin:/bin:/sbin",
#	}


}
