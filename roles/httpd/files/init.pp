class httpd{
	package{"httpd":
		provider=>yum,
		ensure=>installed
	}
	
	package{"mod_wsgi":
		provider=>yum,
                ensure=>installed
	}


	file{"/etc/httpd/conf/httpd.conf":
		owner=>"root",
		group=>"root",
		mode=>"644",
		source=>"puppet://$puppetserver/modules/httpd/httpd.conf",
	}~>
	service{"httpd":
                ensure=>true,
                enable=>true,
        }

}
