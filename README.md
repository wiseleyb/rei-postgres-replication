# rei-postgre-replication Rails 7 example

# koyo-postgres-replicaiton Rails 7 example

This is an example of using the [koyo-postgres-replication
gem](https://github.com/wiseleyb/koyo-postgres-replication) with Rails 7. See
[koyo-postgres-replication
README](https://github.com/wiseleyb/koyo-postgres-replication) for more details
on this Gem (you should start there if you found this on Google)

There's no UI with this (simple API Rails project)... this is meant for
console.

## Commits showing exactly what was changed 

* [Add gem to Rails](https://github.com/wiseleyb/rei-postgres-replication/commit/eb197d4b7e2304b36a746ea3bdf54ae96ba46c27)
* [Add Docker for this project](https://github.com/wiseleyb/rei-postgres-replication/commit/3bdbb1f5522fb787fad9214b5a4d3becc78afcb6)

## Quick Start

I'd recommend using Docker for this but, depending on how your system is setup
this might work:

```
git clone https://github.com/wiseleyb/rei-postgres-replication
cd rei-postgres-replication
git co rails-7-example
bundle install
bundle exec rake db:setup db:migrate db:test:prepare
bundle exec rspec spec
bundle exec rails c
```

## Docker

Aliases used for docker commands

```
alias dccomp='docker-compose'
alias dccop='docker-compose run web rubocop'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
alias dcbuild='docker-compose build'
alias dccon='docker-compose run web bundle exec rails c'
alias dcrails='docker-compose run web bundle exec rails'
alias dcrake='docker-compose run web bundle exec rake'
alias dcreset='docker-compose down && docker rm -f $(docker ps -a -q); docker volume rm $(docker volume ls -q); docker-compose up -d'
alias dcrspec='docker-compose run web bundle exec rspec'
alias dcbundle='docker-compose run web bundle install'
```

To run docker:

```
# If you're running into problems it might be caching related... this will 
# delete ALL docker content - so be warned
# dcimplode

# make entrypoint executable
chmod 755 entrypoint.sh

# build and run
dcup --build
```

You now have Rails and the koyo:repl server running... to do other things:

```
dccon                             # runs rails console

# run specs
dcrake db:create db:test:prepare RAILS_ENV=test
dcrspec                           # runs rspec tests

dcrake                            # run rake tasks
dcrake koyo:repl:install          # installs config/handlers/examples
dcrake koyo:repl:diagnostics      # runs diagnostics
```

### What is docker, why use it?

I'm definitely a newb to docker but it allows a "simple" (docker isn't very
simple) to run different versions of servers on the same system. It basically
runs containerized servers. This can be helpful if you're doing stuff like
consulting where one company is on Rails 4 and the other is Rails 7 ... getting
those to run side-by-side on your Mac is non-trivial/impossible due to things
like openssl conflicts, etc. 

On a Mac, to get started with docker [download Docker for your
system](https://www.docker.com) from https://www.docker.com/

## Explore code

```
bundle open koyo-postgres-replication
```

## Diagnostics

```
bundle exec rake koyo:repl:diagnostics
```

If there are errors like: Error: PG::ObjectNotInPrerequisiteState try dropping
and recreating the replication slot:

```
bundle exec rails c
Koyo::Repl::Utils.delete_replication_slot!
Koyo::Repl::Utils.create_replication_slot!
```

## Running the server

```
bundle exec rake koyo:repl:run_server
```

And run a quick test from console:

```
u = User.first
u.name = "Bob #{Time.now}"
u.save
```

And you should see some output in the server.

*IMPORTANT* you should only run one server. You can't scale this by running
mulple servers because things like update order should matter to you and you'll
get locking in short order. You can decrease the delay between checks (which is
1 second currently) to speed things up if you want though.

## Contributing/Feedback

Please include the output of `bundle exec rake koyo:repl:diagnostics` with any
issue you need help with!

### Find an issue/bug, was something confusing?

File an [issue with the
project](https://github.com/wiseleyb/rei-postgres-replication/issues) 
with as many details as possible and I'll try to fix/help/clarify.

### Need help?

File an [issue with the
project](https://github.com/wiseleyb/rei-postgres-replication/issues) and I'll
try to get back to you ASAP.

### Want to contribute

Fork project on https://github.com/wiseleyb/rei-postgres-replication

[Follow github's guide](https://docs.github.com/en/get-started/quickstart/contributing-to-projects)

Add specs to your changes
Change README if needed

Run specs `bundle exec rspec spec`
Run linter `rubocop`

Create Pull Request as described in the github guide

Create an [issue with the
project](https://github.com/wiseleyb/rei-postgres-replication/issues)  and I'll
try to get back to you ASAP. Feel free to create an issue first if you want to 
check on something before doing work.

And - THANKS for helping
