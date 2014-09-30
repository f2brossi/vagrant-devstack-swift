class devstack( $dir = '/home/stack/devstack') {

  package { ['git']:
    ensure => 'installed',
  }

  $source = 'https://github.com/openstack-dev/devstack'

  $branch = 'master'


  vcsrepo { 'devstack':
    path     => '/home/stack/devstack',
    ensure   => present,
    provider => git,
    source   => 'https://github.com/openstack-dev/devstack.git',
    revision => $version,
    owner    => 'stack',
    group    => 'stack',
    require  => Package['git'],
  }



  file { "$dir/local.conf":
    ensure  => file,
    path    => '/home/stack/devstack/local.conf',
    content => template('devstack/local.conf.erb'),
    owner => 'stack',
    group => 'stack',
    mode  => 644,
  }

  exec {"stack.sh":
    require => File["$dir/local.conf"],
    cwd => $dir,
    path => "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:.",
    environment => "HOME=/home/stack",
    user => 'stack',
    group => 'stack',
    command => "$dir/stack.sh",
    timeout => 0
  }
}