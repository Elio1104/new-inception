#!/bin/sh
envsubst < /var/lib/mysql/init.sql | sponge /var/lib/mysql/init.sql
exec $@
