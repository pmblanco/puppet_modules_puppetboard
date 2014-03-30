class puppetboard::params {

  case $::operatingsystem {
    'Ubuntu': {
	  $puppetboard_package         = 'puppetboard'
	  
	}
	
	default: {
	  fail ("$::operatingsystem is not supported")
	}
	
  }

  $document_root       = '/var/www/puppetboard'
  $puppetdb_host       = 'localhost'
  $puppetdb_port       = '8081'
  
}