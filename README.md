# ShoppingList

## Diagramme de classe
Le diagramme de classe de l'api est le suivant :

[![](https://mermaid.ink/img/pako:eNqVkk1vgzAMhv9K5ONEKz61Nsd1k7bDTr1NuViQ0qgkYSFIY4j_vhAYG5MqrblgPX79xjbpIdcFBwp5hU3zKLA0KJki7nhCnrXk_QQI2YiCkqM1QpULUig5Jc0aXni3Fg6_PY9nXf_D82r9AS0vtenIjY2tTF4slzc24eB7i8oK66YTyi60NiJ32lOl8QcKdUBjKXnQuuKolhamYNwrYRAxIJuNC-5cMO7levZ76kkxav8qxpGm7BjN0GejVT0EILmRKAr34_0OGNgzl5wBdWGB5sKAqcHpsLX62KkcqDUtD6CtC2czvxOgJ6yahT4VwmqzwBoV0B4-gCZZss3CJE7iKEvT-yRNA-iAhkMAn1o7m2gbTicOd_s0jXf7ALh3e51f5_jxlm--wF8xfAHS58-x?type=png)](https://mermaid.live/edit#pako:eNqVkk1vgzAMhv9K5ONEKz61Nsd1k7bDTr1NuViQ0qgkYSFIY4j_vhAYG5MqrblgPX79xjbpIdcFBwp5hU3zKLA0KJki7nhCnrXk_QQI2YiCkqM1QpULUig5Jc0aXni3Fg6_PY9nXf_D82r9AS0vtenIjY2tTF4slzc24eB7i8oK66YTyi60NiJ32lOl8QcKdUBjKXnQuuKolhamYNwrYRAxIJuNC-5cMO7levZ76kkxav8qxpGm7BjN0GejVT0EILmRKAr34_0OGNgzl5wBdWGB5sKAqcHpsLX62KkcqDUtD6CtC2czvxOgJ6yahT4VwmqzwBoV0B4-gCZZss3CJE7iKEvT-yRNA-iAhkMAn1o7m2gbTicOd_s0jXf7ALh3e51f5_jxlm--wF8xfAHS58-x)

### Running the server
La première étape est de créer un fichier .env à la racine du projet. Ce fichier doit contenir les variables suivantes :
```
DATABASE_URL=[MONGO URL]
PORT=[PORT NUMBER]
```

Pour démarrer le serveur, vous devez d'abord installer les dépendances avec `npm install`. Ensuite, vous pouvez démarrer le serveur avec `npm start`. Le serveur se lancera sur le port spécifié dans le fichier .env.

Cependant, si vous ne souhaitez pas installer les dépendances ou créer une base de données MongoDB, vous pouvez utiliser la version hébergée de l'API qui se trouve à l'adresse suivante : https://shoppinglist-3ki9.onrender.com/.

Pour voir la documentation de l'API, vous pouvez vous rendre à l'adresse suivante : https://shoppinglist-3ki9.onrender.com/docs.
Pour utiliser l'API, vous devrez démarrer à l'adresse suivante : https://shoppinglist-3ki9.onrender.com/home.

Le serveur implémentant des liens HATEOAS, vous pourrez naviguer dans l'API en suivant les liens fournis par le serveur. Je vous conseille d'utiliser le [client de Postman](https://www.postman.com/downloads/) pour tester l'API.
