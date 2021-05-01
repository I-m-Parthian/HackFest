# HackFest - A hackathon/challenge posting portal

## Software Requirements

- Ruby 2.6.6
- Rails 5.1.0

## Installation

- To play with the code simply clone the repo on your local system
- before running this project one must install the following dependencies inside the root directory of the project
```sh
$ bundle install
$ yarn
```

Note: The database used in the project is MySQL. So, one must install MySQL before running the project

- Creating and migrating the database
```sh
$ rake db:create
$ rake db:migrate
```
- Hosting on a local server
```sh
$ rails server
```