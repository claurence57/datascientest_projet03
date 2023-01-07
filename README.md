# datascientest_projet03

L'objectif du projet est de créer une base de données à partir des informations suivantes:
[https://data.world/datafiniti/electronic-products-and-pricing-data].

Vu la forme des données, celles-ci ont été mises dans une base de données relationnelle. 
Le choix a été de le faire avec postgres, mais MySQL aurait bien sûr pu convenir aussi.

Le docker-compose permet de lancer 3 conteneurs permanents:
- postgresdb: la DB chargé à partir du fichier csv - port 5432
- fastapi: une API qui permet d'effectuer quelques requêtes sur la DB - port 8000
- dbui: permet d'interroger la DB postgres via une interface Web - port 8080
Les ports exposés sont les mêmes que les port d'origine.

2 conteneurs sont lancés pour vérifier:
- que l'api est accessible: apistatus
- que l'api arrive à se connecter sur la DB: db_connexion

Dans l'api sont définis quatre points d'entrée:
- /status: le status de l'API. renvoie une erreur 400 si elle n'est pas fonctionnelle
- /dbconnexion : vérifie que l'API arrive à se connecter sur la DB
- /categories: renvoie la liste des catégories primaires de produit
- /brands: renvoie la liste des marques vendues

Le fichier setup.sh permet de télécharger ou de construire les images nécéssaires. 
Il faut adapter la vairable BASE_DIR="/home/christophe/Trav/docker/datascientest_projet03" àà l'environnement.

Le script faisant appel à la commande sudo il sera nécessaire de rentrer le mot de passe du user pour que les commandes docker puissent s'exécuter.

