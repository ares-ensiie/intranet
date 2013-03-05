# Ares API v1

_Ce document décrit le fonctionnement de l'API v1 de ARES_

## Sécurité

_On distingue les endpoint accessible par des application et ceux accessible par des utilisateurs. Les applications s'authentifient avec des **tokens d'application** et les utilisateur s'authentifient avec des **tokens utilisateur**._

### Accès application

Les endpoints qui ne manipulent pas de ressources appartenant à un utilisateur en particulier ne demandent pas d'authentifier un utilisateur. On peux accéder à ces endpoints simplement en passant les paramètres `client_id` et `client_secret` aux différents endpoints.

Les tokens sont généré à la création de votre application et vous pouvez les trouver dans les informations relatives à votre application. Si vous ne savez pas comment créer une application, nous vous invitons à [suivre le guide de création d'application](/doc/create_application).

_Dans la documentation anglo-saxonne, ces tokend sont appelés "userless tokens"._

### Accès utilisateur

Certains endpoints permettent d'accéder à des données utilisateur. Pour l'authentification et l'autorisation de vos applications, nous implémentons [le protocole OAuth2](http://oauth.net/2/).

Pour comprendre le fonctionnement du protocole OAuth2, nous vous conseillons de lire [le tutoriel qui vous expliquera comment créer l'application Strasbourg d'Or](/doc/strasbourg-d-or).

### Erreurs

Nous n'avons pas encore défini les réponses de notre API en cas d'erreur. Pour l'instant vous pouvez vous fier aux status code `401` et `50X`.

- `401` Unauthorized : Les tokens donnés ne fonctionnent pas
- `50X` : La faute viens de Ares, merci de [nous contacter sur notre bug tracker](https://bug.ares-ensiie.eu/projects/retour-utilisateurs/issues/new).

## Resources

### Utilisateurs

#### Informations sur un utilisateur

    GET /users/:username

Ce endpoint permet de récupérer des informations à propos d'un utilisateur à condition de connaitre sont `username`.

##### Exemple de requête

    GET /users/chobert2010

##### Response

    Status: 200 OK
    
```json
{
  "id": "5123bf6c104729020000004f",
  "username": "chobert2010",
  "first_name": "Paul",
  "last_name": "Chobert",
  "email": "paul@chobert.fr",
  "promotion": "2013",
  "avatar": {
    "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf6c/1047/2902/0000/004f/original/gravatar.jpg?1361310612",
    "formats": {
      "mini": {
        "format": "50x50#",
        "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf6c/1047/2902/0000/004f/mini/gravatar.jpg?1361310612"
      },
      "thumb": {
        "format": "150x150#",
        "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf6c/1047/2902/0000/004f/thumb/gravatar.jpg?1361310612"
      },
      "original": {
        "format": "500x500>",
        "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf6c/1047/2902/0000/004f/original/gravatar.jpg?1361310612"
      }
    }
  }
}
```

#### Recherche d'utilisateur

    GET /users/search

Les paramètres possibles sont :
- `q` : Ce paramètre peut désigner soit le username, le nom, le prénom, le surnom d'un utilisateur. Vous pouvez faire la recherche avec `q=bee` qui vous donnera les utilisateurs ayant soit le prénom, nom, ou … `bee` ou vous pouvez spécifier l'attribut sur lequel vous souhaitez faire la recherche. `q=first_name:leo` cherchera les élèves qui ont pour prénom `leo` (les accents ne sont pas pris en compte dans la recherche). Il est possible d'utiliser une `*` comme wildcard, je ne précise pas l'effet de `q=p*`.
- `promotion` : Ce paramètre permet de filtrer par la promotion des utilisateurs, `promotion=2012` ne retournera que des étudiants de la promotion `2012`. Il est possible de passer deux promotions en paramètres `promotion=2012,2013` retourne des étudiant des promotions `2012` ou `2013`.

##### Exemple de requête

    GET /users/search?q=first_name:lu*&promotion=2013,2014

##### Reponse

    Status: 200 OK

```json
[
  {
    "id": "5123bf66104729020000004d",
    "username": "bee2010",
    "first_name": "Lucas",
    "last_name": "Bee",
    "email": "MASKED",
    "promotion": "2013",
    "avatar":{
      "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf66/1047/2902/0000/004d/original/Lucas_Bee.jpg?1361297254",
      "formats":{}
    }
  },
  {
    "id": "5123bf69104729020000004e",
    "username": "bertot2010",
    "first_name": "Luke",
    "last_name": "Bertot",
    "email": "MASKED",
    "promotion": "2013",
    "avatar":{
      "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf69/1047/2902/0000/004e/original/luke.jpg?1361381150",
      "formats":{
        "mini":{
          "format": "50x50#",
          "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf69/1047/2902/0000/004e/mini/luke.jpg?1361381150"
        },
        "thumb":{
          "format": "150x150#",
          "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf69/1047/2902/0000/004e/thumb/luke.jpg?1361381150"
        },
        "original":{
          "format": "500x500>",
          "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/bf69/1047/2902/0000/004e/original/luke.jpg?1361381150"
        }
      }
    }
  },
  {
    "id": "5123becb104729020000000e",
    "username": "saurel2011",
    "first_name": "Lucas",
    "last_name": "Saurel",
    "email": "MASKED",
    "promotion": "2014",
    "avatar":{
      "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/becb/1047/2902/0000/000e/original/Lucas_Saurel.jpg?1361297099",
      "formats":{
        "mini":{
          "format": "50x50#",
          "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/becb/1047/2902/0000/000e/mini/Lucas_Saurel.jpg?1361297099"
        },
        "thumb":{
          "format": "150x150#",
          "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/becb/1047/2902/0000/000e/thumb/Lucas_Saurel.jpg?1361297099"
        },
        "original":{
          "format": "500x500>",
          "url": "//ares-intranet.s3.amazonaws.com/users/avatars/5123/becb/1047/2902/0000/000e/original/Lucas_Saurel.jpg?1361297099"
        }
      }
    }
  }
]
```

### Promotions

##### Liste des promotions

    GET /promotions

__/!\ CE ENDPOINT EST SUCEPTIBLE DE CHANGER /!\__

Pour l'instant, ce endpoint liste toute les promotions et affichent tout les étudiants ce ces pormotions.

#### Afficher une promotion

    GET /promotion/:name

##### Exemple de requête

    GET /promotion/2012

##### Reponse

    Status: 200 OK
    
```json
{
  "id": "5123befa1047290200000020",
  "name": "2012",
  "number_of_students": 9,
  "students": [
    {
      "id": "5123befa1047290200000021",
      "username": "boutry2009",
      "email": "boutry.pierre@gmail.com",
      "first_name": "Pierre",
      "last_name": "Boutry",
      "promotion": "2012",
      "avatar": {
        "url": "/avatars/original/missing.png",
        "formats": {
          "mini": {
            "format": "50x50#",
            "url": "/avatars/mini/missing.png"
          },
          "original": {
            "format": "500x500>",
            "url": "/avatars/original/missing.png"
          },
          "thumb": {
            "format": "150x150#",
            "url": "/avatars/thumb/missing.png"
          }
        }
      }
    },
    ...
  ]
}
```

## Vocabulaire

- __endpoint__  : C'est l'adresse pour accéder à une ressource.
