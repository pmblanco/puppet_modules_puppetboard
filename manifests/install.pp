class puppetboard::install {

  ensure_resource('package','python-pip',{ensure => present}) 
  
  package { $puppetboard::params::puppetboard_package:
    ensure    => installed,
    provider  => 'pip',
  }

}