
/**
 * This is the default platform.js
 */

// const platformConstants = function () {
//         document.addEventListener('deviceready', () => {
//                 const elem = document.getElementsByClassName('appFullName');
//                 elem.innerHTML = "Web Scraper Web Application";
//         })
// }

// // apply platform specific rules
// function platformConstants() {
//         // platform specific rules
//         // execute when page load starts
//         document.addEventListener('load', () => {
//                 return document.querySelector('h2 . appFullName').textContent = "Web Scraper Web Application";
//         },
//             false);
// }


const platformConstants = {
    appFullName: "Web Scraper Web Application"
}

module.exports.platformConstants = platformConstants;