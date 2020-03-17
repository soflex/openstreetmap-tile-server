# Servidor de Mapas

Este Docker contiene un Servidor de Mapas (Ubuntu Linux + Postgres + Apache (Mapnik))

Solamente los programas instalados. El apache si queda corriendo.

A esta imagen le falta Iniciar el Postgres y cargar la base de datos del Postgres.

## Compilar imagen

docker build . -t nahuelatienza/osm:VERSION

Siendo version algo del estilo numero.numero.numero

## Subir imagen

docker push nahuelatienza/osm:VERSION

