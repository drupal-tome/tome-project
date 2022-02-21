#! /bin/bash

# This runs a new Docker container, mounts the current directory (Drupal root),
# and runs an arbitrary drush command.

sudo docker run --rm -it --init -v "$(pwd)":/var/www/tome mortenson/tome drush "$@"
