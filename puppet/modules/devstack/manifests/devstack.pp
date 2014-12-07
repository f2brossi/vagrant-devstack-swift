class devstack::devstack( $dir = '/home/stack/devstack') {

  package { ['git']:
    ensure => 'installed',
  }

  $source = 'https://github.com/openstack-dev/devstack'

  $branch = 'master'

    exec {"install devstack":
    	 command => "git clone https://github.com/openstack-dev/devstack.git",
	 cwd     => '/home/stack/',
         path => "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:.",
	 user    => 'stack',
	 require => Package['git'],
   }


  file { "$dir/local.conf":
    ensure  => file,
    path    => '/home/stack/devstack/local.conf',
    content => template('devstack/local.conf.erb'),
    owner => 'stack',
    group => 'stack',
    mode  => 644,
    require => Exec['install devstack'],
  }

  exec {"stack.sh":
    require => File["$dir/local.conf"],
    cwd => $dir,
    path => "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:.",
    environment => "HOME=/home/stack",
    user => 'stack',
    group => 'stack',
    command => "$dir/stack.sh",
    timeout => 0,
    logoutput => "on_failure"	
  }
}
