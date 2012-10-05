# Lattis
A Beautiful Rails-based Patient Research Information System

## Description
A flexible organizational framework for the capture and archival of patient
activity within a medical environment. Lattis logically compartmentalizes an
individual's study involvement to facilitate longitudinal audits of research
center resource allocation.

## Installation for Development

1. Clone the repo ```git://github.com/terracatta/lattis.git```

1. Install gem dependencies ```cd nopey && bundle install```

1. Copy over the database config
  ```cp config/database.yml.template config/database.yml```

1. Configure the database settings  ```open config/database.yml```

1. Setup and seed the database ```bundle exec rake db:setup```

1. Populate the database with fake data ```bundle exec rake db:populate`

1. Run the rails server ```bundle exec rails server```

1. Browse to http://0.0.0.0:3000

## Deployment
Lattis can be deployed to a vanilla Ubuntu server (that has a sudo user called
 "deploy" and ssh enabled) by running the following commands

1. In the root of the application run ```cap deploy:install``` this will install
  all of the application dependencies (apache, postgres, node, passenger)

1. Then run ```cap deploy:setup``` and enter the desired PostgreSQL password

1. Finally, run ```cap deploy:cold``` to setup the app folder structure, upload
the application, and install it.

## License
Please refer to the LICENSE file found in the root of the project.
