# Repositorio para SQL 2000
Dockerfile para el Ambiente de Apache & PHP con soporte del driver SQL Server ODBC sobre Ubuntu Trusty

### Instalar imagen
```bash
docker pull lectorrss/docker-mssql-php5
```

### Construir imagen
```bash
docker build -t lectorrss/docker-mssql-php5 .
```

### Lanzar servidor
```bash
docker run -d -p 80:80 lectorrss/docker-mssql-php5
```
With custom `www` folder:
```bash
docker run -d -p 80:80 -v ruta_repo_local:/var/www/ lectorrss/docker-mssql-php5
```

# Other
Descomenta estas lineas en el Archivo Docker para reparar errores con el UT8 de texto o tiempo:
```bash
ADD freetds.conf /etc/freetds/
ADD locales.conf /etc/freetds/
```
