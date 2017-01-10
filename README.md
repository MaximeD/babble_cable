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
