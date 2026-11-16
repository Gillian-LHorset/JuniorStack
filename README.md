# JuniorStack

Projet de préparation à l'ICT-Challenger.

## Installation

Créez un container docker mysql :

```bash
docker run -d --name mysql-container -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=<mot_de_passe_root> \
  -e MYSQL_DATABASE=<ma_base> \
  -e MYSQL_USER=<mon_user> \
  -e MYSQL_PASSWORD=<mot_de_passe_user> \
  mysql:8
```
