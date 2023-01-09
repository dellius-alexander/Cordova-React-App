/* This is iOS merges/ios/js/index.js */

// apply platform specific rules
function platformConstants() {
    // platform specific rules
    // execute when page load starts
    document.addEventListener('load', () => {
            return document.querySelector('div . appFullName').innerHTML = "<h2>Cordova React iOS Application</h2>"

        },
        false);
}


// const platformConstants = {
//     appFullName: "Web Scraper iOS Application"
// }

platformConstants();
