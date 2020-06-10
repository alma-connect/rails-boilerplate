# rails-boilerplate
Steps for Initial Setup

1.For setting up rails application 
 'rails new .'.
 
2.Updating gems to latest version 'bundle install'.

3.Integrating devise gem for user registration.'rails generate devise:install' 

4.Generating model for users 'rails generate devise User'. Followed by running migration rails db:migrate.
Sign up form for user registration.

5.The controller for Home page i.e pages_controller created and page views created.

6.Integrating active admin gem to the app along with following gems
1. gem 'activeadmin'
2. gem 'cancancan'
3. gem 'draper'
4. gem 'pundit'

7.Using existing user class 'User' for active admin for getting data for user model.
running migration 'rails db:migrate' and loading data 'rails db:seed'.

Admin credentials: 
 email: 'admin@example.com', password: 'password'.
 
8.Integrating delayed_job gem for running jobs in backend. 

gem 'delayed_job_active_record'

To generate a jobs table for Active Record 'rails generate delayed_job:active_record'
and running 'rails db:migrate'.


