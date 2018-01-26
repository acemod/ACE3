# Source of https://ace3mod.com/

## Updating compiled JavaScript and CSS files

- Install [Node.js](https://nodejs.org/download/)
- Open Command Prompt and navigate to `src` directory
    ```
    cd <ACE3_directory>/docs/src
    ```

- Install Node packages
    ```
    npm install
    ```
    _On Bash on Ubuntu on Windows also install `nodejs-legacy` in case of errors._

- Update files
    ```
    grunt
    ```

## Setting up the Jekyll environment

### Using Docker

We include files for [Docker](https://www.docker.com/) to run Jekyll in a separate container. This allows you to not having to install anything apart from Docker on your computer.

#### Running the Dockerfile

- Install [Docker](https://www.docker.com/)
- cd into the `/docs/` directory
- Open Command Prompt and navigate to this directory
    ```
    cd <ACE3_directory>/docs
    ```

- Build and run the container
    ```
    docker-compose up
    ```

- Navigate to [http://localhost:4000](http://localhost:4000)


### Manually

#### Installing prerequisites

##### Windows (CMD)

- Install [Ruby 2.0.0-p648 (x64)](http://rubyinstaller.org/downloads/)
- Install [Ruby DevKit for 2.0 (x64)](http://rubyinstaller.org/downloads/)
- Open Command Prompt and navigate to this directory
    ```
    cd <ACE3_directory>/docs
    ```

- Install `bundler` gem
    ```
    gem install bundler
    ```

- Install required gems through `bundler`
    ```
    bundle install
    ```


#### Debian / Bash on Ubuntu on Windows

- Open Bash and navigate to this directory
    ```
    cd <ACE3_directory>/docs
    ```

- Install `make` and `gcc`
    ```
    sudo apt-get install make gcc
    ```

- Install `ruby2.0`, `ruby2.0-dev` and `ruby-switch`
    ```
    sudo apt-add-repository ppa:brightbox/ruby-ng
    sudo apt-get update
    sudo apt-get install ruby2.0 ruby2.0-dev ruby-switch
    ```

- Set Ruby version
    ```
    sudo ruby-switch --set ruby2.0
    ```

- Install `bundler`
    ```
    sudo gem install bundler
    ```

- Install required gems through bundler
    ```
    bundle install
    ```

- In case of sticky folder error during `bundle install`, execute the following to fix permissions
    ```
    find ~/.bundle/cache -type d -exec chmod 0755 {} +
    ```

#### Running

- Run Jekyll through bundler
    ```
    bundle exec jekyll serve --future --incremental --config _config_dev.yml
    ```
    _Use `--force_polling` on Bash on Ubuntu on Windows due to a bug preventing watching._

- Navigate to http://localhost:4000

