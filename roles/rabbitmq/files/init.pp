class rabbitmq{
	package{"rabbitmq-server":
		provider=>yum,
		ensure=>installed,
	}
	
	service{"rabbitmq-server.service":
		ensure=>running,
		enable=>true,
	}->

	exec{"rabbitmqctl":
		command=>"rabbitmqctl add_user openstack RABBIT_PASS123??",
		path   =>"/usr/bin:/usr/sbin:/bin:/sbin",
		refreshonly => true
	}->

	exec{"rabbitmq_permission":
                command=>'rabbitmqctl set_permissions openstack ".*" ".*" ".*"',
                path   =>"/usr/bin:/usr/sbin:/bin:/sbin",
		refreshonly => true
        }

}
