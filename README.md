user_goals
==========

This is a sample api based on a prototype schema for a user / goals system by Ben Darlow. It has been modified to run on Heroku and use Grape for the API framework. 

Deployment
----------

### Pre-reqs

To run on Heroku, you should have a heroku account and the [heroku toolbelt](https://toolbelt.heroku.com/) installed on your machine

### Steps

To deploy to Heroku, simply clone this repo and run `heroku create` on the folder.

This will create a heroku application which you can quickly and easily deploy by running `git push heroku master`

Routes
------

* `/meals.json` => all meal categories
* `/activities.json` => all activity categories
* `/food/:id.json` => all foods within the given category (meal)
* `/activity/:id.json` => all activities within the given category
* `/user/:id.json` => a specified user's details, including any goals within their plan
