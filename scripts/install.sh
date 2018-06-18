#!/usr/bin/env bash

drush site-install minimal -y
drush en tome -y
drush tome:import -y
drush cr
drush uli
