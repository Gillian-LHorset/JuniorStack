# Backend

## Installation

### DB

Créez un container docker avec la commande suivante :

```bash
    docker run -d \
  --name <container_name> \
  -e POSTGRES_USER=<user> \
  -e POSTGRES_PASSWORD=<password> \
  -e POSTGRES_DB=<db_nom> \
  -p <port>:<port> \
  -v pgdata:/var/lib/postgresql/data \
  postgres:17
```

### Mettre en place l'environnement

Copiez le fichier `.env.exemple` et rennomez le `.env`.

Changez la valeur `DATABASE_URL` pour correspondre à votre container docker.

### Serveur

Depuis la racine, ouvrez un terminal :

```bash
cd Backend/
```

Installez les dépendances :

```bash
npm install
```
