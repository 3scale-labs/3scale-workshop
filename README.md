3scale Worshop: Crash Course - Practical API Management
======================================================================

This is a sample api based on a prototype schema for a user / goals system by Ben Darlow to be used for the "Crash Course - Practical API Management" workshop first delivered at APIStrat 2014 in Chicago. It has been modified to run on Heroku and use Grape for the API framework. 

You can find a full set of links to follow along with the rest of the workshop [here](http://bit.ly/3scaleworkshop)

Deployment
----------

To deploy to Heroku, simply click this button: 

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This will also create a 3scale account for you. 

On successful deploy, follow the "View it" link on Heroku to get your 3scale account details. 

### Alternative Deploy Instructions

In case the deploy to Heroku button fails, you can use the following alternative steps as long as you have the Heroku toolbox installed.

From a terminal run the following curl:

```
curl -u :`heroku auth:token` -H 'Accept: application/vnd.heroku+json; version=3' -X POST -d '
{
  "source_blob": {
    "url": "https://github.com/3scale/3scale-workshop/tarball/master"
  },
  "app": {
    "stack": "cedar"
  },
  "overrides": {
    "env": {
      "THREESCALE_ADMIN_EMAIL":"YOUR_EMAIL_ADDRESS",
      "THREESCALE_ADMIN_PWD": "YOUR_CHOSEN_PASSWORD",
      "ORG_NAME": "YOUR_ORGANISATION_NAME"
    }
  }
}
' https://api.heroku.com/app-setups
```

This will return json similar to the below:

```json
{
  "id": "DEPLOY_ID",
  "failure_message": null,
  "status": "pending",
  "app": {
    "id": "APPLICATION_ID",
    "name": "APPLICATION_NAME"
  },
  "build": {
    "id": null,
    "status": null
  },
  "manifest_errors": [
    
  ],
  "postdeploy": {
    "output": null,
    "exit_code": null
  },
  "resolved_success_url": null,
  "created_at": "2014-10-17T10:54:43+00:00",
  "updated_at": "2014-10-17T10:54:43+00:00"
}
```
You can use the following call to check whether your application has fully deployed or is still pending:

```
curl -n -X GET https://api.heroku.com/app-setups/DEPLOY_ID -H "Accept: application/vnd.heroku+json; version=3"

```

Will return the following on successful deploy:

```json
{
  "id": "DEPLOY_ID",
  "failure_message": null,
  "status": "succeeded",
  "app": {
    "id": "APPLICATION_ID",
    "name": "APPLICATION_NAME"
  },
  "build": {
    "id": "BUILD_ID",
    "status": "succeeded"
  },
  "manifest_errors": [
    
  ],
  "postdeploy": {
    "output": null,
    "exit_code": null
  },
  "resolved_success_url": "http://APPLICATION_NAME.herokuapp.com/success",
  "created_at": "2014-10-17T14:00:18+00:00",
  "updated_at": "2014-10-17T14:01:21+00:00"
}
```

The deploy takes a few minutes, so you might need to call the endpoint a couple of times before you get the `resolved_success_url` shown. 
Once the API is deployed, you should visit the `resolved_success_url` to automatically create a 3scale account with the data entered in the application deploy step (email, password and org name.)


Routes
------

Here are some sample routes the API provides:

* `/api/meals.json` => all meal categories
* `/api/activities.json` => all activity categories
* `/api/food/:id.json` => all foods within the given category (meal)
* `/api/activity/:id.json` => all activities within the given category
* `/api/user/:id.json` => a specified user's details, including any goals within their plan

Sample users
------------

These are for the https://user-goals-api.herokuapp.com application only. Other clones of this repo will have different random users created.

Password is `password` for every user, apart from admin, where the password is `admin`

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