# BabbleCable

This is an experiment with Rails's [ActionCable](http://edgeguides.rubyonrails.org/action_cable_overview.html).

It gives you ephemeral chat rooms:
go into one and start talking, when another user reaches a room with the same name
as the one you created, he will be able to post there too.
Once every users will leave the room, it will be destroyed along with all its messages.

# Setup

Create and configure your postgresql database.

Create file `config/application.yml` with the following:

```
development:
  babble_cable_development_database: <database name>
  babble_cable_development_user: <user name>
  babble_cable_development_password: <user password>

test:
  babble_cable_test_database: <database name>
  babble_cable_test_user: <user name>
  babble_cable_test_password: <user password>
```
