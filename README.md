# Modulo puppet para puppetboard

## Introducci�n
Modulo de puppet para la instalaci�n y configuracion de puppetboard. De momento muy b�sico, pero con opciones a poder extenderlo m�s

De momento solo funciona con apache y con el m�dulo wsgi. Funciona en local a puppetdb, o si lo vamos a instalar en un servidor diferente habr� que configurar el servidor jetty de puppetdb para que permita conexion desde fuera al puerto NO SSL

## Dependencias
Se ha de cumplir una serie de requisitos para que el m�dulo funcione:

* Funciona en ubuntu (probado en precise) y en Centos 6
* Se necesita un modulo de apache (recomendado puppetlabs-apache) que cree el "document root" donde va la configuraci�n .py y se ha de ejecutar antes
* Dependencia de m�dulo puppetlabs-stdlib

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

### v.0.4 23/07/2015
Arreglado problema con provider pip de recursos package. En las �ltimas versiones usa el binario /usr/bin/pip-package y este no existe. Se soluciona creando un enlace simb�lico

### v.0.3 12/11/2014
Solucionamos el problema de que no est� el paquete python-pip en el sistema.
A cambio tenemos dependencia de m�dulo puppetlabs-stdlib

### v.0.2. 02/04/2014
Soluciones a problemas con el fichero de configuracion settings.py solucionados
Se fuerza para que los ficheros .erb sean format de fin de l�nea linux
El nombre del paquete se definie igual para todos los S.0. ya que es un paquete de PIP

### v.0.1. 30/03/2014

