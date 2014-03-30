# Modulo puppet para puppetboard

## Introducci�n
Modulo de puppet para la instalaci�n y configuracion de puppetboard. De momento muy b�sico, pero con opciones a poder extenderlo m�s

De momento solo funciona con apache y con el m�dulo wsgi. Funciona en local a puppetdb, o si lo vamos a instalar en un servidor diferente habr� que configurar el servidor jetty de puppetdb para que permita conexion desde fuera al puerto NO SSL

## Dependencias
Sin dependencia de m�dulos especificos, pero si que se ha de cumplir una serie de requisitos para que el m�dulo funcione:

* De momento solo funciona con Ubuntu (probado en precise)
* Se necesita un modulo de apache (recomendado puppetlabs-apache) que cree el "document root" donde va la configuraci�n .py y se ha de ejecutar antes
* El paquete de phyton-pi ha de estar instalado (posible m�duo de gesti�n de phyton?)

## Ejemplo de uso

En esta primerisima versi�n esta configuraci�n que defino abajo es funcional.

```
  package { 'python-pip':
    ensure         => installed,
  }
  
  class { 'apache':
    default_vhost   => false,
  }
  
  apache::vhost { 'puppetboard':
    port                        => '80',
    docroot                     => '/var/www/puppetboard',
    wsgi_daemon_process         => 'puppetboard',
    wsgi_daemon_process_options =>
      { processes    => '2', 
        threads      => '15', 
       },
    wsgi_process_group          => 'puppetboard',
    wsgi_script_aliases         => { '/' => '/var/www/puppetboard/wsgi.py' },
  }  
  
  class { 'puppetboard':
    puppetdb_host  => '<host>',
	puppetdb_port  => '8080',
	require        => [
	  Package['python-pip'],
	  Apache::Vhost['puppetboard']
	],
  }
```
## Autores
Pedro Miguel Blanco

## Changelog

### v.0.1. 30/03/2014

