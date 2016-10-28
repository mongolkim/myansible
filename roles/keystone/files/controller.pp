node 'controller.openstacklocal'{
#	include setenforce
	include yum
#	include basic_pa
#	include ntp_master
	include mariadb
	include rabbit
	include httpd
	include memcached
	include keystone
#	include glance
#	include controller_nova
#	include controller_neutron
#	include horizon
#	include controller_cinder
}

