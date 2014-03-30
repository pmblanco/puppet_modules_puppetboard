class puppetboard::install {
  
  package { $puppetboard::params::puppetboard_package:
    ensure    => installed,
    provider  => 'pip',
  }

}