class memcached{
	package{"memcached":
		ensure=>installed
	}
	file{"/etc/sysconfig/memcached":
		owner=>"root",
		group=>"root",
		mode=>"644",
		source=>"puppet://$puppetserver/modules/memcached/memcached"
	}
	service{"memcached":
		ensure=>running,
		enable=>true,
	}
}
