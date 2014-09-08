Strava Onebox
=============

Strava Onebox for embeding strava rides

Install in Discourse 1.0

```sh
cd /var/discourse
./launcher ssh app
cd /var/www/discourse
rake plugin:install repo='https://github.com/mrloop/strava_onebox.git'
exit
./launcher restart app
./launcher ssh app
cd /var/www/discourse
rake posts:refresh_oneboxes
```

You need to use a url from the 'Embed on Blog' code e.g. http://www.strava.com/activities/190948728/embed/7dc1376fba9ec275bf3b41a2df3d423ed2f5c6ae

Example at http://elgin.cc/t/australian-pursuit-race/66/2
