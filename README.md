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

Sample users
------------

These are for the user-goals-api.herokuapp.com application only. Other clones of this repo will have different random users created.

Password is `password` for every user

```json
{  
   "id":1,
   "username":"admin",
   "email":"pili@3scale.net",
   "password":"$2a$10$APK.E6wYN9QyOJbg.mniUOL1yPWXhtVcxCoIlNrd9E6aVhc08nbry"
},
{  
   "id":2,
   "username":"richie.bruen",
   "email":"richie.bruen@example.org",
   "password":"$2a$10$VEm1iSXvJcnMA2MtHCWmJ.jxEUbqYhNROieQNTzgOVLJlvZ6U5Kr.",
   "reward":"Generic reward"
},
{  
   "id":3,
   "username":"rod.kassulke",
   "email":"rod.kassulke@example.net",
   "password":"$2a$10$WBhXMN.kwEAmjpWsbXOgVeUP6N9M6skm9XvrLJLFFwmOyXDcoEC6a",
   "reward":"Generic reward"
},
{  
   "id":4,
   "username":"tari.parisian",
   "email":"tari.parisian@example.co.uk",
   "password":"$2a$10$ATEYU5W37A14pLpH.oS3/.43NRaWerVcJGv2mIWyEaclwB.nDMQkG",
   "reward":"Generic reward"
},
{  
   "id":5,
   "username":"cathy.ankunding",
   "email":"cathy.ankunding@example.co.uk",
   "password":"$2a$10$I1By56cTtIEsOxlxpZngGuiS3TZFWVCkVswQ4zYYmH1uBQ9QlQsMi",
   "reward":"Generic reward"
},
{  
   "id":6,
   "username":"nery.von",
   "email":"nery.von@example.org",
   "password":"$2a$10$s3VR9O6U5k3m.0XbHrdlQurjfhMvjI6eczZl3BYjhpcI8KgcxdvqG",
   "reward":"Generic reward"
},
{  
   "id":7,
   "username":"scotty.pfeffer",
   "email":"scotty.pfeffer@example.org",
   "password":"$2a$10$l3YZrqI16IyovOxHD7xPiOIlUEzm.1b7kGtA2AsqN.7H/fo6oLe5a",
   "reward":"Generic reward"
},
{  
   "id":8,
   "username":"nickolas.monahan",
   "email":"nickolas.monahan@example.net",
   "password":"$2a$10$xgQavdeYYGHMMEbX9mI3QOOSNdez7KMjEXnRHWLA.DS9x1HsO1nAG",
   "reward":"Generic reward"
},
{  
   "id":9,
   "username":"jayson.bogan",
   "email":"jayson.bogan@example.org",
   "password":"$2a$10$VG4/cFBg7vj8lmWv51hTWeW6Au2el/tjhk0je8joXUwii5vaUjbEW",
   "reward":"Generic reward"
},
{  
   "id":10,
   "username":"scottie.murphy",
   "email":"scottie.murphy@example.com",
   "password":"$2a$10$21KwXy08mktrm7wugHgKbuE6SC6f/aePhHYMhfBkWwmK4Z6dC06qC",
   "reward":"Generic reward"
},
{  
   "id":11,
   "username":"virgil.bergnaum",
   "email":"virgil.bergnaum@example.org",
   "password":"$2a$10$s5xRXKK8kEBmeVO3e0sh5.10PGHFYg5iWupuVdJcA9u5WFwAXrJNe",
   "reward":"Generic reward"
}
```