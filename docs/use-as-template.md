# Using this repository as a template to get started


<h3>Using the template repository</h3>

***Note: When using this repository as a template remember to `rename the project`, `set the config.xml` file and create a `www` directory from the project root. If you don't create the `www` directory Cordova will not recognize the project as a cordova project.***

```bash
# create a new name for the location of your new repository
$ git clone https://github.com/dellius-alexander/Cordova-React-App.git   new_app_root_directory_name
$ cd new_app_root_directory_name
# create www directory
$ mkdir -p ${PWD}/www
# set the config file
$ cordova config set ./config.xml
# test 
$ cordova config ls 
{
    "": {
        "/config": {
            "xml": true
        }
    }
}
$ cordova platform add browser ios android
# check requirements
$ cordova requirements
# run cordova app
$ echo NODE_ENV=development | npm run build; cordova run browser --debug;
```

Now everything should work properly.
You can follow the [setup guide](./cordova-react-app.md) for more information.
