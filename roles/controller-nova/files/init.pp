class controller_nova{
	package{"openstack-nova-api":
		provider=>yum,
		ensure=>installed,
	}	
	package{"openstack-nova-cert":
                provider=>yum,
                ensure=>installed,
        }
	package{"openstack-nova-conductor":
                provider=>yum,
                ensure=>installed,
        }
	package{"openstack-nova-console":
                provider=>yum,
                ensure=>installed,
        }
	package{"openstack-nova-novncproxy":
                provider=>yum,
                ensure=>installed,
        }
	package{"openstack-nova-scheduler":
                provider=>yum,
                ensure=>installed,
        }
	package{"python-novaclient":
                provider=>yum,
                ensure=>installed,
        }~>
	
	file{"/etc/nova/nova.conf":
		owner=>"root",
		group=>"root",
		mode=>"644",
		source=>"puppet://$puppetserver/modules/controller_nova/nova.conf"
	}

	file{"/root/nova.sh":
                owner=>"root",
                group=>"root",
                mode=>"755",
                source=>"puppet://$puppetserver/modules/controller_nova/nova.sh"
        }
	
}
