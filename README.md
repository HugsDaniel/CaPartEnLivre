# GIT

Pour installer Git :

`sudo apt install -y git`

# RUBY

D'abord on clean tout :
```
rvm implode && sudo rm -rf ~/.rvm
# If you got "zsh: command not found: rvm", carry on. It means `rvm` is not
# on your computer, that's what we want!

rm -rf ~/.rbenv
```

Puis on installe Ruby avec rbenv :

```
sudo apt install -y build-essential tklib zlib1g-dev libssl-dev libffi-dev libxml2 libxml2-dev libxslt1-dev libreadline-dev
sudo apt clean
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

Ferme le terminal, relance le, puis :

`rbenv install 2.6.3`

Et une fois l'install terminée :

`rbenv global 2.6.3`

Ferme le terminal, relance, et vérifie avec :

`ruby -v`

Tu devrais voir un truc du genre `ruby 2.6.3p`


# BUNDLER

Lance :

`gem install bundler`

# Postgresql

Pour la base de donnée, il faut installer Postgres :

```
sudo apt install -y postgresql postgresql-contrib libpq-dev build-essential
sudo -u postgres psql --command "CREATE ROLE `whoami` LOGIN createdb;"
```

Puis :

`echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p`

# RAILS

Lance :

`gem install rails -v 5.2`

Puis pour vérifier :

`rails --version`

# NODE

Lance :

```
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```

# YARN

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```


Et là normalement tu devrais être bon.


# TUCHIPARTY

Le github du projet : https://github.com/HugsDaniel/tuchiparty/tree/tuchi

Dans le terminal :

`git clone git@github.com:HugsDaniel/tuchiparty.git`

Puis :

`cd tuchiparty`
`git checkout tuchi`
`bundle install`
`yarn install`
`rails db:create db:migrate db:seed`
`rails s`

Ensuite dans le navigateur, va sur `localhost:3000` et tu devrais arriver sur le login !

Une fois ton compte créé tu peux créer un groupe depuis la sidebar, et t'es bon.


## CSS

Tous les fichiers .scss sont sous `app/assets/stylesheets`. Tout ce qui est dans ces fichiers est accessible dans tous les fichiers HTML du projet.

## HTML

Les vues sont sous `app/views`.

## JS

C'est un peu spécial dans Rails, on utilise Webpack. Grosso modo tout le JS est dans `app/javascript`.

Si tu veux tester du JS, mets le dans `app/javascript/packs/application.js`, il sera effectif sur toutes les pages.



Je te ferai un topo front dans Rails un de ces 4, juste pr que tu saches où mettre quoi et comment !
