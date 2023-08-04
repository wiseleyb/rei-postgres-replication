# koyo-postgres-replicaiton Rails 7 example

## Setup

```
gem 'koyo-postgres-replication'
bundle install
bundle exec rake koyo:repl:install
```

## Diagnostics

```
bundle exec rake koyo:repl:diagnostics
```

If there are errors like: Error: PG::ObjectNotInPrerequisiteState try dropping
and recreating the replication slot:

```
be rails c
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




