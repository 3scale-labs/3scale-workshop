User Goals API
==============

This is a sample api based on a prototype schema for a user / goals system by Ben Darlow. It has been modified to run on Heroku and use Grape for the API framework. 

Deployment
----------

To deploy to Heroku, simply click this button: 

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This will also create a 3scale account for you. 

On successful deploy, follow the "View it" link on Heroku to get your 3scale account details. 

Routes
------

* `/meals.json` => all meal categories
* `/activities.json` => all activity categories
* `/food/:id.json` => all foods within the given category (meal)
* `/activity/:id.json` => all activities within the given category
* `/user/:id.json` => a specified user's details, including any goals within their plan
