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

> Note: pour MacOS la procédure d'installation utilise [Homebrew](http://brew.sh/), un gestionnaire de package très bien pensé et propre à MacOS (l'équivalent de `apt-get` sous Ubuntu). Pensez à faire `brew update` et `brew upgrade` pour mettre à jour vos packages, avant de commencer l'installation. 
De la même façon pensez à faire `sudo apt-get update` sur Debian.



###Installation

Installer ruby:

Il ne suffit pas de faire: (**ne faites pas la commande suivante!**)

- MacOS: 
`brew install ruby`
	
- Debian: 
`sudo apt-get install ruby`

En effet il y a un problème de version de Ruby. La plupart des distributions vont télécharger avec ces commandes Ruby 1.8 alors qu'il faut Ruby 2.0.
Pour pallier à ce problème il faut installer Ruby avec `rbenv`, un utilitaire qui gère correctement les versions de Ruby.

- MacOS:
`brew install rbenv ruby-build` 

- Debian:

```shell 
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
```
Plus d'informations peuvent être trouvées pour Ubuntu [ici](http://gorails.com/setup/ubuntu/13.10).

Il suffit alors d'installer Ruby avec `rbenv`:

- MacOS/Debian:

```shell
rbenv install 2.1.2
rbenv global 2.1.2
ruby -v
```
				
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

```shell
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


###Seeds
Les seeds sont des données d'exemple pratique pour la phase de dévelopement.
Pour créer la base de données et créer les seeds: `rake db:setup`.
Si la base de données existe déjà: `rake db:seed`.

Si une erreur du genre `User: username must be unique` apparait, c'est que des données de type User existent déjà en base de données.
Il faut alors faire dans mongo: `db.users.remove()`.

On peut vérifier que les données ont bien été créées en base de données par deux moyens:

- Rails: faire `rails c` puis par exemple pour User:

```
User.all
User.first
```

- Mongo: faire `mongo` puis par exemple pour User:

```
use intranet_sxb_development
db.users.find()
```

PS1: Les seeds pour User esquivent la phase de confirmation du compte via l'attribut `confirmed_at`.
Pour tester cette phase, il suffit d'enlever cet attribut des seeds ou de le mettre à `nil`.

PS2: Certains attributs ne peuvent être assignés directement, car ils sont protégés.
Pour qu'un attribut soit assignable, il faut qu'il y ait la mention `attr_accessible :mon_attribut` dans le model.


###Développement
Pour lancer le serveur: 
`rails server`
ou 
`rails s`
	
Par défaut le serveur se lance sur le port 3000. On peut voir le résultat sur [http://localhost:3000](http://localhost:3000]).

Pour lancer la base de données:
		
- MacOS: 
`mongod`

- Debian:
`sudo start mongodb`
