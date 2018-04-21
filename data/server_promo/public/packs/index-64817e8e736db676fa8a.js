/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/*!***************************************!*\
  !*** ./app/javascript/packs/index.js ***!
  \***************************************/
/*! dynamic exports provided */
/*! all exports used */
/***/ (function(module, exports) {

document.addEventListener("turbolinks:load", function () {

    var map = new GMaps({
        div: '#map',
        lat: -22.9045491,
        lng: -47.0502439
    });

    window.map = map;

    var pois = JSON.parse(document.querySelector("#map").dataset.pois);
    window.pois = pois;

    // var bounds = new google.maps.LatLngBounds();

    pois.forEach(function (poi) {
        if (poi.latitude && poi.longitude) {
            var marker = map.addMarker({
                lat: poi.latitude,
                lng: poi.longitude,
                title: poi.address,
                infoWindow: {
                    content: "<p>\n            <h3>" + poi.string + "</h3>\n            <a href='/pois/" + poi.id + "'>" + poi.address + "</a>\n            </p>"
                }
            });
            // bounds.extend(marker.position);
        }
    });
    // map.fitBounds(bounds);

    //     map.drawRoute({
    //   origin: [-22.9045491, -47.0502439],
    //   destination: [-22.8902546, -47.0488902],
    //   travelMode: 'driving',
    //   strokeColor: '#131540',
    //   strokeOpacity: 0.6,
    //   strokeWeight: 6
    // });

    // var l = document.querySelector("#map").dataset.l;
    //     if (l) {
    //         var latlng = l.split(',');
    //         var southWest = new google.maps.LatLng(latlng[0], latlng[1]);
    //         var northEast = new google.maps.LatLng(latlng[2], latlng[3]);
    //         var bounds = new google.maps.LatLngBounds(southWest, northEast);
    //         map.fitBounds(bounds);
    //         } else {
    //             map.fitZoom();
    //         }

    var l = document.querySelector("#map").dataset.l;
    if (l) {
        var latlngs = l.split(',');
        var southWest = new google.maps.LatLng(latlngs[0], latlngs[1]);
        var northEast = new google.maps.LatLng(latlngs[2], latlngs[3]);
        var bounds = new google.maps.LatLngBounds(southWest, northEast);
        map.fitBounds(bounds, 0);
    } else {
        map.fitZoom();
    }

    document.querySelector("#redo-search").addEventListener("click", function (e) {
        e.preventDefault();

        var bounds = map.getBounds();
        var location = bounds.getSouthWest().toUrlValue() + "," + bounds.getNorthEast().toUrlValue();

        Turbolinks.visit("/pois?l=" + location);
    });
});

/***/ })
/******/ ]);
//# sourceMappingURL=index-64817e8e736db676fa8a.js.map