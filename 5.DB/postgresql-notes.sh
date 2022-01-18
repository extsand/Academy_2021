#!/bin/bash
# more about install
# https://www.postgresql.org/download/linux/ubuntu/
echo 'Install PostgreSQL'


sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql
echo 'Installation is Done'

# enter to postgres
sudo -u postgres psql postgres
#remote postgresql
psql -h localhost -U username -d database_name

# create role for postresqs
sudo -u postgres createuser --superuser $USER

#create DB
createdb test_db

# delete DB
DROP DATABASE db_name
# or
dropdb test+db 

#looking to db list
#https://andreyex.ru/bazy-dannyx/baza-dannyh-postgresql/kak-vyvesti-spisok-baz-dannyh-i-tablits-postgresql-s-pomoshhyu-psql/
sudo -u postgres psql
\list

#create table inside DB
create table customer(id serial primary key, name varchar(255), phone varchar(30)));
create table product( id serial primary key, name varchar(255), description text, price integer);
create table product_photo( id serial primary key, url varchar(255), product_id integer references product(id));

#Show existing DB
\d








