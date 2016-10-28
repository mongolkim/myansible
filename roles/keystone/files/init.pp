class keystone{
#	exec{"create":
#		command=>'mysql -uroot -e "create database keystone"',
#		path  =>"/usr/bin:/usr/sbin:/bin:/sbin",
#		refreshonly=>true
#	}->

#	exec{"localhost":
#               command=>"GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' IDENTIFIED BY 'KEYSTONE_DBPASS123??';",
#                path  =>"/usr/bin:/usr/sbin:/bin:/sbin",
#               refreshonly=>true
#        }



	package{"openstack-keystone":
		provider=>yum,
		ensure=>installed,
	}
	
	package{"python-memcached":
		provider=>yum,
                ensure=>installed,
	}

	file{"/root/admin-openrc.sh":
		owner=>"root",
		group=>"root",
		mode=>"755",
		source=>"puppet://$puppetserver/modules/keystone/admin-openrc.sh",
	}

	file{"/root/demo-openrc.sh":
                owner=>"root",
                group=>"root",
                mode=>"755",
                source=>"puppet://$puppetserver/modules/keystone/demo-openrc.sh",
        }

	file{"/etc/keystone/keystone.conf":
		owner=>"root",
                group=>"root",
                mode=>"644",
                source=>"puppet://$puppetserver/modules/keystone/keystone.conf",
	}

	file{"/etc/httpd/conf.d/wsgi-keystone.conf":
                owner=>"root",
                group=>"root",
                mode=>"644",
                source=>"puppet://$puppetserver/modules/keystone/wsgi-keystone.conf"
	}

#	exec{"httpd":
#		command=>"systemctl restart httpd",
#		path  =>"/usr/bin:/usr/sbin:/bin:/sbin",
#		refreshonly=>true,		
#	}

}
