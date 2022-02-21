#! /bin/bash

# This runs a new Docker container, mounts the current directory (Drupal root),
# and runs "drush runserver", mapping port 8888 from the host to the container.

sudo docker run --rm -it -p 8888:8888 -v "$(pwd)":/var/www/tome mortenson/tome drush runserver 0.0.0.0:8888 "$@"
