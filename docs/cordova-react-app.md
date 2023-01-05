<h1 id="#title"><a href="#">Cordova </a></h1>
<hr/>


Apache Cordova is a mobile application development framework that allows developers
to build native mobile apps using web technologies like HTML, CSS, and JavaScript.
Cordova provides a set of APIs that allow developers to access native device functionality,
such as the camera, GPS, and storage, from within their web-based code.

One of the main benefits of using Cordova is that it allows developers to build mobile
apps that can run on multiple platforms, including Android, iOS, and Windows, using the
same codebase. This can save a lot of time and resources, as it means that developers do
not have to create separate versions of the app for each platform.

Another benefit of Cordova is that it allows developers to leverage the vast ecosystem of
web technologies, tools, and libraries that are available for building web applications.
This can make it easier to build complex, feature-rich apps using a familiar set of tools.

On the downside, one potential drawback of Cordova is that the resulting apps may not
always feel as "native" as those built using platform-specific tools and languages. This
is because Cordova apps are essentially web applications that are running within a native
container, and may not always be able to take full advantage of all the native device
capabilities.

Another potential issue with Cordova is that it may not always be possible to achieve the
same level of performance as a native app, especially for more complex or resource-intensive
tasks. In these cases, a native app may be a better choice.

Overall, Cordova is a useful tool for building cross-platform mobile apps quickly and
efficiently, but it is not always the best choice for every situation. It is important
to carefully consider the specific needs and requirements of your project before deciding
whether to use Cordova or another mobile development framework.

Use Apache Cordova if you are:

- a mobile developer and want to extend an application across more than one platform,
  without having to re-implement it with each platform's language and tool set.

- a web developer and want to deploy a web app that's packaged for distribution in
  various app store portals.

- a mobile developer interested in mixing native application components with a WebView
  (special browser window) that can access device-level APIs, or if you want to develop
  a plugin interface between native and WebView components. Plugin interfaces gives you
  the ability to leverage native functionality such as camera, battery, in-app-browser and
  so much more. [See the plugin at https://cordova.apache.org/plugins/](https://cordova.apache.org/plugins/)


<hr/>

<h2 id="#sample"><a href="#">Sample App Starter</a></h2>

Here is a brief overview of how you can build a web scraper using
Apache Cordova, Node.js, and JavaScript for the browser, iOS, and
Android platforms:

1. First, install Apache Cordova using npm (Node Package Manager):

    ```bash
    npm install -g cordova
    ```

2. Create a new Cordova project:

    ```bash
    cordova create myapp
    cd myapp
    ```

3. Add the platforms you want to support (e.g. browser, iOS, Android):

    ```bash
    cordova platform add browser
    cordova platform add ios
    cordova platform add android
   ```

4. Install the required dependencies for web scraping, such as the
   `request` and `cheerio` libraries:

    ```bash
    npm install request cheerio

    ```

5. Create a new JavaScript file (e.g. `scraper.js`) and import the
   `request` and `cheerio` libraries:

    ```javascript
    const request = require('request');
    const cheerio = require('cheerio');
    ```

6. Use the `request` library to send an HTTP request to the website
   you want to scrape, and use the `cheerio` library to parse the HTML
   response and extract the data you need. Create a file called `js/scraper.js`
   with the following code to scrape a website:

    ```javascript
    module.exports = function scrape(url, callback){
        request(url, (error, response, html) => {
            if (!error && response.statusCode === 200) {
            const $ = cheerio.load(html);
            // Extract data from the HTML response using jQuery-like syntax
            const data = $('#profile').attr('class').text();
            console.log(data);
            callback(data);
            }
        });
    }
    ```

7. Build and run your Cordova project using the cordova run command:

    ```bash
    cordova build
    cordova run browser
    cordova run ios
   # Note: You must download android emulator in order to run android
    cordova run android
    ```
   
   <a href="#android-emulator">See here for more details on how to setup the android emulator</a>

<hr/>

<h2 id="plugins"><a href="#">Add Plugins</a></h2>

You can modify the default generated app to take advantage of standard
web technologies, but for the app to access device-level features, you
need to add plugins.

A plugin exposes a Javascript API for native SDK functionality. Plugins
are typically hosted on npm, and you can search for them on the [plugin
search page](https://cordova.apache.org/plugins/). Some key APIs are
provided by the Apache Cordova open source project and these are referred
to as [Core Plugin APIs](https://cordova.apache.org/docs/en/11.x/guide/support/index.html#core-plugin-apis).

To add and save plugins to `package.json`, we use `cordova cli` to add plugins:

```bash
cordova plugin add \
  cordova-plugin-device \
  cordova-plugin-dialogs  \
  cordova-plugin-inappbrowser \
  cordova-plugin-webpack

Installing "cordova-plugin-device" for android
Installing "cordova-plugin-device" for browser
Installing "cordova-plugin-device" for ios
Adding cordova-plugin-device to package.json
Installing "cordova-plugin-dialogs" for android
Installing "cordova-plugin-dialogs" for browser
Installing "cordova-plugin-dialogs" for ios
Adding cordova-plugin-dialogs to package.json
Installing "cordova-plugin-inappbrowser" for android
Installing "cordova-plugin-inappbrowser" for browser
Installing "cordova-plugin-inappbrowser" for ios
Adding cordova-plugin-inappbrowser to package.json
Installing "cordova-plugin-webpack" for android
Installing "cordova-plugin-webpack" for browser
Installing "cordova-plugin-webpack" for ios
Adding cordova-plugin-webpack to package.json

```

Plugins can also be added using a directory or a git repo.

*NOTE: The CLI adds plugin code as appropriate for each platform. If you
want to develop with lower-level shell tools or platform SDKs as discussed
in the [Overview](https://cordova.apache.org/docs/en/11.x/guide/overview/index.html),
you need to run the Plugman utility to add plugins
separately for each platform. (For more information, see [Using Plugman to
Manage Plugins](https://cordova.apache.org/docs/en/11.x/plugin_ref/plugman.html).)*

Use `cordova` `plugin ls` (or `plugin list`, or `plugin` by itself) to view currently
installed plugins. Each displays by its identifier:

```bash
cordova plugin ls

cordova-plugin-device 2.1.0 "Device"
cordova-plugin-dialogs 2.0.2 "Notification"
cordova-plugin-inappbrowser 5.0.0 "InAppBrowser"
cordova-plugin-webpack 1.0.5 "Webpack"

```

If you want all page loads in your app to go through the InAppBrowser,
you can simply hook `window.open` during initialization. For example:

```javascript
document.addEventListener("deviceready", onDeviceReady, false);
function onDeviceReady() {
    window.open = cordova.InAppBrowser.open;
}
```

<hr />

<h3 id="plugins"><a href="https://github.com/kotarella1110/cordova-plugin-webpack#features">Webpack Plugin</a></h3>

You can choose to install `Cordova Webpack Plugin` using npm install or
add the following to your `package.json` file.

```bash
npm install -D webpack@5 webpack-cli@5 webpack-dev-server@4;
cordova plugin add cordova-plugin-webpack;
```

You can use the Cordova Webpack plugin to automate this process by
specifying the path to your Webpack configuration file in the Cordova
configuration file `config.xml`. This will allow you to build and run
your Cordova app with a single command:

```bash
cordova run android --webpack
```

To specify the path to your Webpack configuration file in the Cordova
configuration file `config.xml`, you can add the following element to
your `config.xml` file:


```xml
<platform name="android">
  ...
  <webpack-config src="webpack.config.js" />
  ...
</platform>
```

This tells Cordova to use the Webpack configuration file located at
`webpack.config.js` when building the Android version of your Cordova app.

[Config.xml configuration file options can be found on Cordova documentation site](https://cordova.apache.org/docs/en/11.x/config_ref/index.html)

You can also specify a different Webpack configuration file for each
platform by using the `name` attribute:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<widget
        id="com.example.appName"
        version="1.0.0"
        xmlns="http://www.w3.org/ns/widgets"
        xmlns:cdv="http://cordova.apache.org/ns/1.0"
>
    ...
    <platform name="android">
        ...
        <webpack-config src="webpack.android.config.js" />
        ...
    </platform>
    ...
    <platform name="ios">
        ...
        <webpack-config src="webpack.ios.config.js" />
        ...
    </platform>
    ...
</widget>
```

This will use the `webpack.android.config.js` file when building the Android
version of the app, and the `webpack.ios.config.js` file when building the iOS
version of the app.

Once you have specified the path to your Webpack configuration file in `config.xml`,
you can build and run your Cordova app with Webpack by using the following command:

```bash
cordova run browser --webpack
cordova run android --webpack
```

Checkout the repository for the [Cordova-Plugin-Webpack](https://github.com/kotarella1110/cordova-plugin-webpack#features)
for more information and customizations.

<hr />

<h2 id="plugins"><a href="https://moduscreate.com/blog/cross-platform-cordova-app-development-with-merges">Working with Merges</a></h2>

`Merges` help to create `modularity` and `extensibility` to your application. It provides the flexibility
to create platform specific specifying our app's look, feel and behavior on a per-platform basis,
without polluting the app's `single JavaScript codebase`.

You can add platforms, such as iOS, Windows, Electron and Android platform specific files. To use merges
we do:

1. `Create a merges directory structure`: Next, create a new directory called `merges` in the root of your Cordova
   project. This directory will be used to store platform-specific files that will be merged into your
   project at build time.
2. `Create platform-specific directories`: Within the `merges` directory, create a subdirectory for each
   platform that you are targeting. For example, if you are targeting Android and iOS, you would create
   the following directories:

   ```bash
   mkdir -p merges/{android,ios,browser}/{assets,css,img,js,libs,res}
   mkdir -p merges/android/res/{layout,xml,icon}
   mkdir -p merges/{ios,browser}/{res}/{icon}
   ```

3. Add platform-specific files: Within each platform-specific directory, add any files that you
   want to include in your project when building for that particular platform.

    - Here is an example of how you might use the "merges" feature to include platform-specific icons in
      your Cordova project:

       ```markdown
       - my-project/
           - merges/
               - android/
                   - css/
                   - img/
                   - js/  
                   - libs/
                   - assets/
                   - java/  
                   - res/
                       - layout/
                       - xml/  
                       - icon/
                           icon.png
               - ios/
                   - css/
                   - img/
                   - js/
                   - libs/
                   - assets/
                   - res/
                       - icon/
                           icon.png
               - browser/
                   - css/
                   - img/
                   - js/
                   - libs/
                   - assets/
                   - res/
                       - icon/
                           icon.png
       - www/
          - index.html
          - css/
          - js/
       - config.xml
       - package.json
       ```

   In this example, the `merges/android/res/icon/icon.png` file would be merged into the
   `platforms/android/app/src/main/res/icon/icon.png` directory when building the Android version of
   the app, and the `merges/ios/res/icon/icon.png` file would be merged into the
   `platforms/ios/my-project/Resources/icons` directory when building the iOS version. This allows
   you to include platform-specific icons in your project without having to maintain separate copies
   of the same file for each platform.

4. Modify the `config.xml` file: In the root of your Cordova project, open the `config.xml`
   file and add the following line to each platform configuration:

   ```xml
   <?xml version="1.0" encoding="utf-8" ?>
   <widget
        id="com.example.appName"
        version="1.0.0"
        xmlns="http://www.w3.org/ns/widgets"
        xmlns:cdv="http://cordova.apache.org/ns/1.0"
   >
   ...
   <platform name="android">
       ...
       <resource-file src="merges/android/*" target="merges" />     
       ...
    </platform>
   ...
   <platform name="ios">
       ...
       <resource-file src="merges/ios/*" target="merges" />
       ...
   </platform>
   ...
   </widget>
   ```

5. Lets `customize merges for Android and iOS platforms` to make sure our platform specific behavior
   will override the default Cordova application:

   ```text
   # Place your custom platform specific behavior for android in these files
   merges/android/css/platform.css
   merges/android/js/platform.js
   merges/android/img/logo.png
    
   # Place your custom platform specific behavior for ios in these files
   merges/ios/css/platforms.css
   merges/ios/js/platform.js
   merges/ios/img/logo.png
   ```

    - Override the default platform specific styles behavior

       ```css
       /* This is Android merges/ios/css/platform.css */
       .event.received {
       background-color:#FF0000;
       }
    
       /* This is iOS merges/ios/css/platform.css */
       .event.received {
       background-color:#0000FF;
       }
       ```   
    - Override the default platform specific javascript behavior

       ```javascript
       /* This is Android merges/android/js/index.js */
       const platformConstants = {
           appFullName: 'Modus Create for Android'
       }
    
    
       /* This is iOS merges/ios/js/index.js */
       const platformConstants = {
           appFullName: 'iOS App by Modus Create'   
       }
       ```

<hr />

<h3>[Click Here To Setup Android Emulator](./android-emulator.md)</h3>



