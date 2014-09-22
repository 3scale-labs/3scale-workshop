APIStrat Chicago 2014 Worshop: Crash Course - Practical API Management
======================================================================

This is a sample api based on a prototype schema for a user / goals system by Ben Darlow to be used for the "Crash Course - Practical API Management" workshop at APIStrat 2014 in Chicago. It has been modified to run on Heroku and use Grape for the API framework. 

Deployment
----------

To deploy to Heroku, simply click this button: 

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This will also create a 3scale account for you. 

On successful deploy, follow the "View it" link on Heroku to get your 3scale account details. 

Routes
------

Here are some sample routes

* `/api/meals.json` => all meal categories
* `/api/activities.json` => all activity categories
* `/api/food/:id.json` => all foods within the given category (meal)
* `/api/activity/:id.json` => all activities within the given category
* `/api/user/:id.json` => a specified user's details, including any goals within their plan
