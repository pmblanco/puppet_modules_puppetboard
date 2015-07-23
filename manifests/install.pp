class puppetboard::install {

  ensure_resource('package','python-pip',{ensure => present})

  file { '/usr/bin/pip-python':
  	ensure     => link,
  	owner      => 'root',
  	group      => 'root',
  	mode       => '0755',
  	target     => '/usr/bin/pip',
  }
  
  package { $puppetboard::params::puppetboard_package:
    ensure    => installed,
    provider  => 'pip',
    require   => [
      Package['python-pip'],
      File['/usr/bin/pip-python']
    ],
  }

}