class compute_nova{
	package{"openstack-nova-compute":
		provider=>"yum",
		ensure=>installed,
	}
	package{"sysfsutils":
                provider=>"yum",
                ensure=>installed,
        }
	
	file{"/etc/nova/nova.conf":
		owner=>"root",
		group=>"root",
		mode=>"644",
		source=>"puppet://puppetserver/modules/compute_nova/nova.conf"
	}
	
}

