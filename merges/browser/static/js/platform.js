
/**
 * This is the default platform.js
 */
// apply platform specific rules
function platformConstants() {
        // platform specific rules
        // execute when page load starts
        document.addEventListener('load', () => {
                return document.querySelector('div . appFullName').textContent = "<h2>Cordova React Web Application</h2>"

        },
            false);
}


// const platformConstants = {
//     appFullName: "Web Scraper Web Application"
// }

platformConstants();
