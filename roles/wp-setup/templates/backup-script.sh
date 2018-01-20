#!/bin/bash

wpdir=/home/{{username}}/{{domain}}/public
dbfile={{db}}.sql
wpconfig=$wpdir/wp-config.php
rsyncdest=/home/{{username}}/{{domain}}/backup

mysqldump --user={{dbuser}} --password={{dbuser_passwd}} --host=localhost --default-character-set=utf8 {{db}} > $wpdir/$dbfile

rsync -az --delete $wpdir/ $rsyncdest

if [ $1 = 'daily' ]
then
    tar -cjSf /home/{{username}}/{{domain}}/backup/{{domain}}-daily.tar.bz2 /home/{{username}}/{{domain}}/
elif [ $1 = 'weekly' ]
then
    tar -cjSf /home/{{username}}/{{domain}}/backup/{{domain}}-weekly.tar.bz2 /home/{{username}}/{{domain}}/
    curl --header 'Access-Token: {{pushbullet_api_key}}' \
         --header 'Content-Type: application/json' \
         --data-binary '{"body":"Created weekly backup","title":"[{{domain}}] Weekly backup created.","type":"note"}' \
         --request POST \
         https://api.pushbullet.com/v2/pushes
fi
