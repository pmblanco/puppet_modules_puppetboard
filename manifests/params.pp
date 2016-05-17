class puppetboard::params {

  $ensure              = 'installed'
  $puppetboard_package = 'puppetboard'
  $document_root       = '/var/www/puppetboard'
  $puppetdb_host       = 'localhost'
  $puppetdb_port       = '8081'

}