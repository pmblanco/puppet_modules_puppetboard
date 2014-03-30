class puppetboard::config(
  $puppetdb_host,
  $puppetdb_port,
  $document_root,
) {

  
  file { 'puppetboard_wsgi_definition':
    ensure   => file,
	path     => "${document_root}/wsgi.py",
	owner    => 'root',
	group    => 'root',
	mode     => 0644,
	content  => template("${module_name}/wsgi.py.erb"),
  }
  
  file { 'puppetboard_settings_file':
    ensure   => file,
	path     => "${document_root}/settings.py",
	owner    => 'root',
	group    => 'root',
	mode     => 0644,
	content  => template("${module_name}/settings.py.erb"),
  }
  
}