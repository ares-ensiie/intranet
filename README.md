[![build status](https://api.travis-ci.org/ares-ensiie/intranet.png)](https://travis-ci.org/ares-ensiie/intranet)

# Intranet étudiant de l'ENSIIE Strasbourg

## Liste des fonctionnalités :
- Gestion des photos/vidéo pour les évènement notamment
- Partage de cours/correction/sujet
- Suivis des étudiants à l’étranger
- Trombinoscope → Page de profil
- Annuaire des entreprises où les étudiants ont fait leur stage + Avis
- Renseignement logement colloc, bon plan etc.
- Ragots !
- Drink IIt ?

##Contribuer

Note: pour MacOS la procédure d'installation utilise [Homebrew](http://brew.sh/), un gestionnaire de package très bien pensé et propre à MacOS (l'équivalent de `apt-get` sous Ubuntu). Pensez à faire `brew update` pour mettre à jour la liste des packages, avant de commencer l'installation. 

###Installation

Installer ruby:

- MacOS: 
`brew install ruby`
	
- Debian: 
`sudo apt-get install ruby`

Cependant il y a un problème de version de Ruby. La plupart des distributions vont télécharger avec ces commandes Ruby 1.8 alors qu'il faut Ruby 2.0.
Pour pallier à ce problème il faut installer Ruby avec `rbenv`, un utilitaire qui gère correctement les versions de Ruby.

- MacOS:
`brew install rbenv ruby-build` 

- Debian:

				
Cloner/forker le repo.
	

Aller dans le dossier du repo: 
`cd intranet`

Installer les dépendances:
`bundle install`
	
Cela peut prendre un peu de temps.
	
Si un message d'erreur disant que `bundle` est inconnu, faire: 
`gem install bundle`

###Plugin
L'intranet utilise `elasticsearch`, un plugin utilisé par Foursquare et Github notamment, qui permet d'exploiter des données (recherches, analyses, etc). Vous avez besoin de l'installer pour que l'application fonctionne correctement.

- MacOS:
`brew install elasticsearch`

- Debian:

```
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.7.deb
sudo dpkg -i elasticsearch-0.90.7.deb
```

Puis pour le lancer:
- MacOS: 
`elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml`

- Debian:
`sudo service elasticsearch start`

###Base de données
Celle utilisée pour l'intranet est `MongoDB` (NoSQL).
Pour l'installer:

- MacOS: 
`brew install mongodb`

- Debian: 	
`sudo apt-get install mongodb-10gen`

###Développement
Pour lancer le serveur: 
`rails server`
	
Par défaut le serveur se lance sur le port 3000. On peut voir le résultat sur [http://localhost:3000](http://localhost:3000]).

Pour lancer la base de données:
		
- MacOS: 
`mongod`

- Debian:
`sudo start mongodb`