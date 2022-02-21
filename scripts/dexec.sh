#! /bin/bash

# This runs a new Docker container, mounts the current directory (Drupal root),
# and runs an arbitrary command. Good for running tests, bash, or tome:preview
# since port 8889 is mapped to the container (ddrush maps no ports).

sudo docker run --rm -it --init -p 8889:8889 --env "SIMPLETEST_DB=sqlite://localhost/.test.sqlite" --env "SIMPLETEST_BASE_URL=http://127.0.0.1:8889" -v "$(pwd)":/var/www/tome mortenson/tome "$@"
