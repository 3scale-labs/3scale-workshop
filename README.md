user_goals
==========

This is a sample api based on a prototype schema for a user / goals system by Ben Darlow. It has been modified to run on Heroku and use Grape for the API framework. 

Deployment
----------


Routes
------

* `/meals.json` => all meal categories
* `/activities.json` => all activity categories
* `/food/:id.json` => all foods within the given category (meal)
* `/activity/:id.json` => all activities within the given category
* `/user/:id.json` => a specified user's details, including any goals within their plan
