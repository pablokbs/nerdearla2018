# Kubernetes Networking

## Demo nerdearla 2018

https://speakerdeck.com/pablokbs/desmitificando-el-networking-en-kubernetes

### Requerimientos

* [kops version >= 1.9 instalado](https://github.com/kubernetes/kops/blob/master/docs/install.md)
* [kubectl instalado](https://github.com/kubernetes/kops/blob/master/docs/install.md)
* [Cuenta DigitalOcean](https://cloud.digitalocean.com/registrations/new)
* [DigitalOcean access token](https://www.digitalocean.com/community/tutorials/how-to-use-the-digitalocean-api-v2#how-to-generate-a-personal-access-token)
* [DigitalOcean Spaces bucket con API Keys](https://www.digitalocean.com/community/tutorials/how-to-create-a-digitalocean-space-and-api-key)
* [Dominio en DigitalOcean](https://www.digitalocean.com/community/tutorials/an-introduction-to-digitalocean-dns#adding-a-domain). Para apuntar tu dominio seguir [esta guia](https://www.digitalocean.com/community/tutorials/how-to-point-to-digitalocean-nameservers-from-common-domain-registrars)
* [Configurar tu key ssh](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-keys-with-digitalocean-droplets)

* Una vez que todo eso está listo, podes crear cluster en Digital Ocean:

	`make create`

* Para borrar el cluster

	`make delete`
 
* Paso 1 de la demo, crea los manifestos y hace el deploy de la app
 
	 `make demo1`
 
* Paso 2, crea la Network Policy que bloquea todo
 
	`make demo2`
 
* Paso 3, crea una Policy que permite el acceso a la UI pero deniega el trafico entre los pods

	`make demo3`
	
* Paso 4, crea policy para permitir el trafico desde el Frontend pod al Backend

	`make demo4`
	
* Paso 5, crea policy para permitir el trafico desde el Cliente al Frontend
	
	`make demo5`
	
* Paso 6, borra todas las policies para que vuelva a andar todo

	`make demo6`
	
* Borra todo para poder volver a empezar

	`make demo-clean`
