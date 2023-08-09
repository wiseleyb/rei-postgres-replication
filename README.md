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
* [Add Docker for this project]()

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

TODO

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
