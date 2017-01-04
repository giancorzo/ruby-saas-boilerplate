Talent Hacking
================

This project implements the main features needed to support the "A" Method of recruting allowing people to recruit easily and allways in the same way.

### Getting Set Up

This site runs on **Ruby 2.3.1** and **Rails 4.2.1**

#### Installing the Site on your Local Machine

1. Make sure to fork this repository
2. When you have it cloned to your local machine make sure your Ruby version is 2.3.1.

##### Populating the Database

The `db/seeds.rb` file is used to populate essential information in order to use the system.  Use the command `rake db:seed` to populate the database. You can run it as many times as you'd like, it deletes all meta data and repopulates it with each run.  For now the seed file creates an administrator user but eventually when the curricula get open-sourced like this project it will create a demo site for you to use.

##### Custom configuration files

To avoid conflicts between developers and to store private environment variables like Github API key we use `figaro` gem. `figaro` creates a file called `application.yml` that's located in the `config/` directory but not checked into git (no, you can't have my passwords).

Check out the [Figaro Documentation](https://github.com/laserlemon/figaro) for a very easy-to-understand explanation of how the gem works. You basically just need to run `rails generate figaro:install` and populate the missing variables in `application.yml`.  You can find an example of the requested variables in `config/application.yml.example`.

##### Running the server

Run `rails server` the app should be running at `http://localhost:3000`.

This is basically all you need to get yourself set up with the repository. Of course, things not always go according to plan when installing things but I'm certain your google skills will light the way.
