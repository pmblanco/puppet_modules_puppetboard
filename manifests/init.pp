class puppetboard (
  $puppetdb_host = $puppetboard::params::puppetdb_host,
  $puppetdb_port = $puppetboard::params::puppetdb_port,
  $document_root = $puppetboard::params::document_root,
) inherits puppetboard::params {

  class { 'puppetboard::install':
  }

  class { 'puppetboard::config':
    puppetdb_host  => $puppetdb_host,
	puppetdb_port  => $puppetdb_port,
	document_root  => $document_root,
  }

}