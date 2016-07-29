[![Build Status](https://travis-ci.org/mrloop/strava_onebox.svg?branch=master)](https://travis-ci.org/mrloop/strava_onebox)

# Strava Onebox

[Strava](https://www.strava.com/) [Onebox]((https://github.com/discourse/onebox) for embedding strava activities in [Discourse](discourse.org)

Example at http://elgin.cc/t/australian-pursuit-race/66/2

### Supported URLs for embeds

You need to use a url from the 'Embed on Blog' code

  - http://www.strava.com/activities/190948728/embed/7dc1376fba9ec275bf3b41a2df3d423ed2f5c6ae

## Installation

```yml

    hooks:
      after_code:
        - exec:
            cd: $home/plugins
            cmd:
              - mkdir -p plugins
              - git clone https://github.com/discourse/docker_manager.git
              - git clone https://github.com/mrloop/strava_onebox.git

```

* Rebuild the container and restart the application

```sh

    cd /var/docker
    ./launcher rebuild app
    ./launcher restart app

```

### Update existing posts

```sh

    ./launcher ssh app
    cd /var/www/discourse
    rake posts:refresh_oneboxes

```

## To run tests

```sh

    ruby -Ilib:test plugin_test.rb

```
