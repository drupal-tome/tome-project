# Composer template for Tome projects

This project is a great place to start for building brand new Tome projects.

There isn't much here now, but keep posted and let me know if anything doesn't
work!

# Requirements

- PHP 7+
- [Composer](https://getcomposer.org/)
- [Drush](https://github.com/drush-ops/drush-launcher#installation---phar)
- SQLite 3.26+ and the related PHP extensions

You can also run Tome inside a Docker container - see the Docker documentation
below for reference.

## Initializing a new project

To create a new Tome project in the `my_site` subdirectory, run:

```bash
mkdir my_site
cd my_site
composer create-project drupal-composer/drupal-project:8.x-dev . # <-- the dot at the end means current directory
composer require drupal-tome/tome-project
composer update
```

Create new SQL database `testdb`, with its own separate user `tome` that has all privileges for that database and only for that database, with a password `mypassword`:

```bash
sudo mysql
MariaDB> create database testdb;
MariaDB> CREATE USER 'tome'@'localhost' IDENTIFIED BY 'mypassword';
MariaDB> grant all privileges on testdb.* to 'tome'@'localhost';
MariaDB> \q
```

Run the normal `site:init` first to set up the database connection (`tome:init` fails to do that). Use the details (database name, user name, password) from the previous step, and accept defaults for all the other values:

```bash
drush site:init
```

To finish the installation, run `tome:init`, accept all defaults:

```bash
drush tome:init
```

## Further usage

To re-install Tome, run:

```bash
drush tome:install
```

To start a local webserver, run:

```bash
drush runserver
```

When you're ready to build your static site, run:

```bash
drush tome:static
```

## Symlinks

When composer install or update is ran, the "modules" and "themes" directories,
as well as the "settings.php" file, is symlinked into the "web" directory.

This is done to improve DX, but only works on systems that support `bash`, and
symlinks. If you're running Windows you'll probably want to write a custom
script to replace `symlink.sh`, and use the `mklink` command. Pull requests are
welcome to make this functionality cross-platform by default.

## Docker

A Docker image for Tome is available on Docker Hub as `mortenson/tome`.

You can use the image instead of local versions of Drush and Composer by
using these included scripts:

- `./scripts/ddrush.sh` - Runs Drush in the current directory.
- `./scripts/drunserver.sh` - Runs `drush runserver` and maps port 8888.
- `./scripts/dexec.sh` - Runs a shell command, use `./scripts/dexec.sh bash` to
open an interactive session.

More instructions on how to use the image can be found at
[drupal-tome/tome-docker].

## Included Netlify, GitPod, and GitHub Pages configuration

For ease of use, `netlify.toml` and `.gitpod.yml` files have been included so
that you can start using these services as soon as you create a project.
Netlify provides free static site hosting and supports Tome, and Gitpod allows
you to edit Drupal content, config, and code without running a local site. For
more information, visit https://netlify.com/ and https://gitpod.io/.

For GitHub Pages, you'll need to copy .example_github to .github and enable
GitHub actions. Then, on commit to `master`, a static site should be exported
to the `gh-pages` branch. You can configure what branch to use for GitHub pages
in the repository settings.

## Further reading

This project is largely based on [drupal-composer/drupal-project], so it's
recommended that you consult their [README.md] for more information.

[drupal-composer/drupal-project]: https://github.com/drupal-composer/drupal-project
[README.md]: https://github.com/drupal-composer/drupal-project/blob/8.x/README.md
[drupal-tome/tome-docker]: https://github.com/drupal-tome/tome-docker
