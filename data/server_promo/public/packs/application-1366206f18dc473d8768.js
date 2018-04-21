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
/******/ 	return __webpack_require__(__webpack_require__.s = 2);
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
                    content: "<p>" + poi.name + "\n            <h3>" + poi.string + "</h3>\n            <a href='/pois/" + poi.id + "'>" + poi.address + "</a>\n            </p>"
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

/***/ }),
/* 1 */
/*!*****************************************!*\
  !*** ./app/javascript/packs/uploads.js ***!
  \*****************************************/
/*! dynamic exports provided */
/*! all exports used */
/***/ (function(module, exports) {

document.addEventListener("turbolinks:load", function () {

    $("[type=file]").fileupload({
        add: function add(e, data) {
            console.log("add", data);
            data.progressBar = $('<div class="progress" style="width: 300px"><div class="progress-bar"></div></div>').insertAfter("body");
            var options = {
                extension: data.files[0].name.match(/(\.\w+)?$/)[0], // set the file extension
                _: Date.now() // prevent caching
            };
            $.getJSON("/images/upload/cache/presign", options, function (result) {
                console.log("presign", result);
                data.formData = result.fields;
                data.url = result.url;
                data.paramName = "file";
                data.submit();
            });
        },
        progress: function progress(e, data) {
            console.log("progress", data);
            var progress = parseInt(data.loaded / data.total * 100, 10);
            var percentage = progress.toString() + '%';
            data.progressBar.find(".progress-bar").css("width", percentage).html(percentage);
        },
        done: function done(e, data) {
            console.log("add", data);
            data.progressBar.remove();

            var image = {
                id: data.formData.key.match(/cache\/(.+)/)[1], // we have to remove the prefix part
                storage: 'cache',
                metadata: {
                    size: data.files[0].size,
                    filename: data.files[0].name.match(/[^\/\\]+$/)[0], // IE return full path
                    mime_type: data.files[0].type
                }
            };

            var form = $(this).closest("form");
            var form_data = new FormData(form[0]);
            form_data.append($(this).attr("name"), JSON.stringify(image));

            $.ajax(form.attr("action"), {
                contentType: false,
                processData: false,
                data: form_data,
                method: form.attr("method"),
                dataType: "json",
                success: function success(response) {
                    var $img = $("<img/>", { src: response.image_url, width: 400 });
                    var $div = $("<div/>").append($img);
                    $("#photos").append($div);
                }
            });
        }
    });
});

/***/ }),
/* 2 */
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! dynamic exports provided */
/*! all exports used */
/***/ (function(module, exports, __webpack_require__) {

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

__webpack_require__(/*! ./index */ 0);
__webpack_require__(/*! ./uploads */ 1);

/***/ })
/******/ ]);
//# sourceMappingURL=application-1366206f18dc473d8768.js.map