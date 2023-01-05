<h1 ><a id="title" href="#">Web Scraper</a> </h1>

<hr/>

<h2><a id="overview">Overview</a></h2>

A `web scraper` is a tool or piece of software that is used to `extract data` from
websites and APIs. It works by making HTTP requests to a website's server, downloading
the HTML of the web page, and then parsing that HTML to extract the data you're
interested in.

Web scrapers can be used to gather data from a variety of websites, such as
`online stores`, `news sites`, `social media platforms`, and `government websites`.
They can be used for a wide range of purposes, including `data mining`, `data
analysis`, and `automated data collection`.

Web scrapers can be built using a variety of programming languages and tools,
such as `Javascript`, `Python`, `Java`, and `Ruby`. Some web scrapers are simple scripts that can
be run from the command line, while others are more complex applications with
a graphical user interface (GUI).

Overall, web scrapers are useful for extracting data from websites that may
not have an API or other means of accessing their data. They can save time
and resources by automating data collection tasks and allowing organizations
to gather and analyze large amounts of data quickly and efficiently.

There are several benefits to building a web scraper application:

1. `Data gathering and analysis`: Web scrapers can be used to gather data
   from websites for various purposes, such as market research, price comparison,
   and data analysis.
2. `Automation`: Web scrapers can be used to automate data collection tasks,
   freeing up time and resources for other activities.
3. `Integration`: Web scrapers can be used to integrate data from multiple
   sources into a single system or database.
4. `Monitoring`: Web scrapers can be used to monitor websites for changes or
   updates, allowing organizations to stay up to date with the latest information.
5. `Personalization`: Web scrapers can be used to personalize content or
   recommendations based on an individual's browsing history or preferences.
6. `Competitive advantage`: Web scrapers can be used to gather data on competitors,
   allowing organizations to stay ahead of the competition and make informed business decisions.

<hr/>

<h2><a id="cordova">Why Apache Cordova?</a></h2>

`Apache Cordova` is a `mobile development platform` that allows you to create `cross-platform
mobile applications` using HTML, CSS, and JavaScript. It provides a set of APIs that allow
you to access native device features, such as the camera, GPS, and accelerometer, from
within your web app. These APIs are implemented as JavaScript libraries, which can be
included in your web app and accessed from within your JavaScript code.

There are a few potential reasons why you might want to use Apache Cordova to build a web scraper:

1. `Cross-platform compatibility`: Cordova allows you to build applications that can run on
   multiple platforms, such as Web Browser, Android, iOS, and Windows, using a `single codebase`. This
   can be useful if you want your web scraper to be accessible on a wide range of devices.
2. `Ease of use`: Cordova uses familiar web technologies, such as HTML, CSS, and JavaScript,
   which may be easier for some developers to learn and use compared to native mobile
   development languages, such as Java or Swift.
3. `Integration with native features`: As mentioned above, Cordova provides access to
   native device features, such as the camera and GPS, which can be useful if you want to
   build a web scraper that utilizes these features.

Applications are typically built using HTML, CSS, and JavaScript, and are packaged
as a native application using Cordova's build tools. When the application is launched, it
loads the HTML and JavaScript of your web app and runs it within a web view, which is
essentially a mini web browser that is embedded within the native application.

So while Cordova is primarily designed for building mobile applications, it can also be
used to build web-based applications that can run in a web browser, either as a standalone
application or as part of a mobile application.


<hr />

<h4><a href="./docs/sample.md" id="sample" >For More Details About Cordova, See Sample Web Scraper</a></h4>

<hr />



---


## Create Cordova React Application

Run the following commands:

```bash
# 1. create the react app first
npx create-react-app cordova-react-app
# 2. commit to git 
git add . && git commit -m "initial commit"
# 3. eject the app
npm run eject
```

This will create a `config/` directory in the root of your project.

Next, create the cordova app by running:

```bash
# 4. create the cordova app from root directory enter
cordova create cordovareactapp com.example.cordovareact CordovaApp
```

Next, move the `config.xml` from the cordovareact app to the root of the top level project.

Next we must edit the `buildPath` variable in the `config/paths.js` file to integrate with cordova.
Change the line where `const buildPath = process.env.BUILD_PATH || 'build'` to:

```javascript
const buildPath = process.env.BUILD_PATH || 'www';
```

Next, add the field `"homepage": "./"` to the `package.json` file in the root of your project.

Next, goto `src/index.js` and add the following:

```javascript
/**
 * Initialize the react app in no matter the platform
 */
const initializeApp = () => {
    const root = ReactDOM.createRoot(document.getElementById('root'));
    root.render(
        <React.StrictMode>
            <App />
        </React.StrictMode>
    );
    // If you want to start measuring performance in your app, pass a function
    // to log results (for example: reportWebVitals(console.log))
    // or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
    reportWebVitals();
}

// if the device is ios or android use cordova,
if (window.cordova) {
    // Wait for the deviceready event before using any of Cordova's device APIs.
// See https://cordova.apache.org/docs/en/latest/cordova/events/events.html#deviceready
    document.addEventListener('deviceready', initializeApp, false);
} else { // instead use the for regular browser web app
    initializeApp();
}


```

Next, add the following to the `public/index.html` file. If this is a boilerplate code 
you can copy the snippet below:

What we did:
- added and updated `Content-Security-Policy` meta tag.
- added additional meta tags for:
  - `format-detection`
  - `msapplication-tap-highlight`
  - `viewport`


```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <!--
       Customize this policy to fit your own app's needs. For more guidance, please refer to the docs:
           https://cordova.apache.org/docs/en/latest/
       Some notes:
           * https://ssl.gstatic.com is required only on Android and is needed for TalkBack to function properly
           * Disables use of inline scripts in order to mitigate risk of XSS vulnerabilities. To change this:
               * Enable inline JS: add 'unsafe-inline' to default-src
       -->
    <meta
            http-equiv="Content-Security-Policy"
            content="default-src 'self' data: https://ssl.gstatic.com 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; media-src *; img-src 'self' data: content:;"
    />
    <meta name="format-detection" content="telephone=no" />
    <meta name="msapplication-tap-highlight" content="no" />
    <meta name="viewport" content="initial-scale=1, width=device-width, viewport-fit=cover" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="theme-color" content="#000000" />
    <meta
            name="description"
            content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <!--
      manifest.json provides metadata used when your web app is installed on a
      user's mobile device or desktop. See https://developers.google.com/web/fundamentals/web-app-manifest/
    -->
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <!--
      Notice the use of %PUBLIC_URL% in the tags above.
      It will be replaced with the URL of the `public` folder during the build.
      Only files inside the `public` folder can be referenced from the HTML.

      Unlike "/favicon.ico" or "favicon.ico", "%PUBLIC_URL%/favicon.ico" will
      work correctly both with client-side routing and a non-root public URL.
      Learn how to configure a non-root public URL by running `npm run build`.
    -->
    <title>React App</title>
</head>
<body>
<noscript>You need to enable JavaScript to run this app.</noscript>
<div id="root"></div>
<!--
  This HTML file is a template.
  If you open it directly in the browser, you will see an empty page.

  You can add webfonts, meta tags, or analytics to this file.
  The build step will place the bundled scripts into the <body> tag.

  To begin the development, run `npm start` or `yarn start`.
  To create a production bundle, use `npm run build` or `yarn build`.
-->
<script type="text/javascript" src="cordova.js"></script>
</body>
</html>
```

Now we can build and run our app.

```bash
npm run build
cordova emulate ios
```
52:54:00:d9:98:95Ss