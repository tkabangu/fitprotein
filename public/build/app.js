(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["app"],{

/***/ "./assets/js/app.js":
/*!**************************!*\
  !*** ./assets/js/app.js ***!
  \**************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var core_js_modules_es_array_for_each__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! core-js/modules/es.array.for-each */ "./node_modules/core-js/modules/es.array.for-each.js");
/* harmony import */ var core_js_modules_es_array_for_each__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(core_js_modules_es_array_for_each__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var core_js_modules_es_object_to_string__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! core-js/modules/es.object.to-string */ "./node_modules/core-js/modules/es.object.to-string.js");
/* harmony import */ var core_js_modules_es_object_to_string__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(core_js_modules_es_object_to_string__WEBPACK_IMPORTED_MODULE_1__);
/* harmony import */ var core_js_modules_es_promise__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! core-js/modules/es.promise */ "./node_modules/core-js/modules/es.promise.js");
/* harmony import */ var core_js_modules_es_promise__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(core_js_modules_es_promise__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var core_js_modules_web_dom_collections_for_each__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! core-js/modules/web.dom-collections.for-each */ "./node_modules/core-js/modules/web.dom-collections.for-each.js");
/* harmony import */ var core_js_modules_web_dom_collections_for_each__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(core_js_modules_web_dom_collections_for_each__WEBPACK_IMPORTED_MODULE_3__);
/* harmony import */ var _scss_app_scss__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../scss/app.scss */ "./assets/scss/app.scss");
/* harmony import */ var _scss_app_scss__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(_scss_app_scss__WEBPACK_IMPORTED_MODULE_4__);





/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */
// any CSS you import will output into a single scss file (app.scss in this case)
 // Need jQuery? Install it with "yarn add jquery", then uncomment to import it.
// import $ from 'jquery';

console.log('Hello Webpack Encore! Edit me in assets/js/app.js');

var $ = __webpack_require__(/*! jquery */ "./node_modules/jquery/dist/jquery.js"); // this "modifies" the jquery module: adding behavior to it
// the bootstrap module doesn't export/return anything


__webpack_require__(/*! bootstrap */ "./node_modules/bootstrap/dist/js/bootstrap.js"); // or you can include specific pieces
// require('bootstrap/js/dist/tooltip');
// require('bootstrap/js/dist/popover');


$(document).ready(function () {
  $('[data-toggle="popover"]').popover();
}); // Suppression des éléments

document.querySelectorAll('[data-delete]').forEach(function (a) {
  a.addEventListener('click', function (e) {
    e.preventDefault();
    fetch(a.getAttribute('href'), {
      method: 'DELETE',
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        '_token': a.dataset.token
      })
    }).then(function (response) {
      return response.json();
    }).then(function (data) {
      if (data.success) {
        a.parentNode.parentNode.removeChild(a.parentNode);
      } else {
        alert(data.error);
      }
    })["catch"](function (e) {
      return alert(e);
    });
  });
});

/***/ }),

/***/ "./assets/scss/app.scss":
/*!******************************!*\
  !*** ./assets/scss/app.scss ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

// extracted by mini-css-extract-plugin

/***/ })

},[["./assets/js/app.js","runtime","vendors~app"]]]);
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vLi9hc3NldHMvanMvYXBwLmpzIiwid2VicGFjazovLy8uL2Fzc2V0cy9zY3NzL2FwcC5zY3NzIl0sIm5hbWVzIjpbImNvbnNvbGUiLCJsb2ciLCIkIiwicmVxdWlyZSIsImRvY3VtZW50IiwicmVhZHkiLCJwb3BvdmVyIiwicXVlcnlTZWxlY3RvckFsbCIsImZvckVhY2giLCJhIiwiYWRkRXZlbnRMaXN0ZW5lciIsImUiLCJwcmV2ZW50RGVmYXVsdCIsImZldGNoIiwiZ2V0QXR0cmlidXRlIiwibWV0aG9kIiwiaGVhZGVycyIsImJvZHkiLCJKU09OIiwic3RyaW5naWZ5IiwiZGF0YXNldCIsInRva2VuIiwidGhlbiIsInJlc3BvbnNlIiwianNvbiIsImRhdGEiLCJzdWNjZXNzIiwicGFyZW50Tm9kZSIsInJlbW92ZUNoaWxkIiwiYWxlcnQiLCJlcnJvciJdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7QUFBQTs7Ozs7O0FBT0E7Q0FHQTtBQUNBOztBQUVBQSxPQUFPLENBQUNDLEdBQVIsQ0FBWSxtREFBWjs7QUFDQSxJQUFNQyxDQUFDLEdBQUdDLG1CQUFPLENBQUMsb0RBQUQsQ0FBakIsQyxDQUNBO0FBQ0E7OztBQUNBQSxtQkFBTyxDQUFDLGdFQUFELENBQVAsQyxDQUVBO0FBQ0E7QUFDQTs7O0FBRUFELENBQUMsQ0FBQ0UsUUFBRCxDQUFELENBQVlDLEtBQVosQ0FBa0IsWUFBVztBQUN6QkgsR0FBQyxDQUFDLHlCQUFELENBQUQsQ0FBNkJJLE9BQTdCO0FBQ0gsQ0FGRCxFLENBSUE7O0FBQ0FGLFFBQVEsQ0FBQ0csZ0JBQVQsQ0FBMEIsZUFBMUIsRUFBMkNDLE9BQTNDLENBQW1ELFVBQUFDLENBQUMsRUFBSTtBQUNwREEsR0FBQyxDQUFDQyxnQkFBRixDQUFtQixPQUFuQixFQUE0QixVQUFBQyxDQUFDLEVBQUk7QUFDN0JBLEtBQUMsQ0FBQ0MsY0FBRjtBQUNBQyxTQUFLLENBQUNKLENBQUMsQ0FBQ0ssWUFBRixDQUFlLE1BQWYsQ0FBRCxFQUF5QjtBQUMxQkMsWUFBTSxFQUFFLFFBRGtCO0FBRTFCQyxhQUFPLEVBQUU7QUFDTCw0QkFBb0IsZ0JBRGY7QUFFTCx3QkFBZ0I7QUFGWCxPQUZpQjtBQU0xQkMsVUFBSSxFQUFFQyxJQUFJLENBQUNDLFNBQUwsQ0FBZTtBQUFDLGtCQUFVVixDQUFDLENBQUNXLE9BQUYsQ0FBVUM7QUFBckIsT0FBZjtBQU5vQixLQUF6QixDQUFMLENBT0dDLElBUEgsQ0FPUSxVQUFBQyxRQUFRO0FBQUEsYUFBSUEsUUFBUSxDQUFDQyxJQUFULEVBQUo7QUFBQSxLQVBoQixFQVFLRixJQVJMLENBUVUsVUFBQUcsSUFBSSxFQUFJO0FBQ1YsVUFBSUEsSUFBSSxDQUFDQyxPQUFULEVBQWtCO0FBQ2RqQixTQUFDLENBQUNrQixVQUFGLENBQWFBLFVBQWIsQ0FBd0JDLFdBQXhCLENBQW9DbkIsQ0FBQyxDQUFDa0IsVUFBdEM7QUFDSCxPQUZELE1BRU87QUFDSEUsYUFBSyxDQUFDSixJQUFJLENBQUNLLEtBQU4sQ0FBTDtBQUNIO0FBQ0osS0FkTCxXQWVXLFVBQUFuQixDQUFDO0FBQUEsYUFBSWtCLEtBQUssQ0FBQ2xCLENBQUQsQ0FBVDtBQUFBLEtBZlo7QUFnQkgsR0FsQkQ7QUFtQkgsQ0FwQkQsRTs7Ozs7Ozs7Ozs7QUM1QkEsdUMiLCJmaWxlIjoiYXBwLmpzIiwic291cmNlc0NvbnRlbnQiOlsiLypcclxuICogV2VsY29tZSB0byB5b3VyIGFwcCdzIG1haW4gSmF2YVNjcmlwdCBmaWxlIVxyXG4gKlxyXG4gKiBXZSByZWNvbW1lbmQgaW5jbHVkaW5nIHRoZSBidWlsdCB2ZXJzaW9uIG9mIHRoaXMgSmF2YVNjcmlwdCBmaWxlXHJcbiAqIChhbmQgaXRzIENTUyBmaWxlKSBpbiB5b3VyIGJhc2UgbGF5b3V0IChiYXNlLmh0bWwudHdpZykuXHJcbiAqL1xyXG5cclxuLy8gYW55IENTUyB5b3UgaW1wb3J0IHdpbGwgb3V0cHV0IGludG8gYSBzaW5nbGUgc2NzcyBmaWxlIChhcHAuc2NzcyBpbiB0aGlzIGNhc2UpXHJcbmltcG9ydCAnLi4vc2Nzcy9hcHAuc2Nzcyc7XHJcblxyXG4vLyBOZWVkIGpRdWVyeT8gSW5zdGFsbCBpdCB3aXRoIFwieWFybiBhZGQganF1ZXJ5XCIsIHRoZW4gdW5jb21tZW50IHRvIGltcG9ydCBpdC5cclxuLy8gaW1wb3J0ICQgZnJvbSAnanF1ZXJ5JztcclxuXHJcbmNvbnNvbGUubG9nKCdIZWxsbyBXZWJwYWNrIEVuY29yZSEgRWRpdCBtZSBpbiBhc3NldHMvanMvYXBwLmpzJyk7XHJcbmNvbnN0ICQgPSByZXF1aXJlKCdqcXVlcnknKTtcclxuLy8gdGhpcyBcIm1vZGlmaWVzXCIgdGhlIGpxdWVyeSBtb2R1bGU6IGFkZGluZyBiZWhhdmlvciB0byBpdFxyXG4vLyB0aGUgYm9vdHN0cmFwIG1vZHVsZSBkb2Vzbid0IGV4cG9ydC9yZXR1cm4gYW55dGhpbmdcclxucmVxdWlyZSgnYm9vdHN0cmFwJyk7XHJcblxyXG4vLyBvciB5b3UgY2FuIGluY2x1ZGUgc3BlY2lmaWMgcGllY2VzXHJcbi8vIHJlcXVpcmUoJ2Jvb3RzdHJhcC9qcy9kaXN0L3Rvb2x0aXAnKTtcclxuLy8gcmVxdWlyZSgnYm9vdHN0cmFwL2pzL2Rpc3QvcG9wb3ZlcicpO1xyXG5cclxuJChkb2N1bWVudCkucmVhZHkoZnVuY3Rpb24oKSB7XHJcbiAgICAkKCdbZGF0YS10b2dnbGU9XCJwb3BvdmVyXCJdJykucG9wb3ZlcigpO1xyXG59KTtcclxuXHJcbi8vIFN1cHByZXNzaW9uIGRlcyDDqWzDqW1lbnRzXHJcbmRvY3VtZW50LnF1ZXJ5U2VsZWN0b3JBbGwoJ1tkYXRhLWRlbGV0ZV0nKS5mb3JFYWNoKGEgPT4ge1xyXG4gICAgYS5hZGRFdmVudExpc3RlbmVyKCdjbGljaycsIGUgPT4ge1xyXG4gICAgICAgIGUucHJldmVudERlZmF1bHQoKVxyXG4gICAgICAgIGZldGNoKGEuZ2V0QXR0cmlidXRlKCdocmVmJyksIHtcclxuICAgICAgICAgICAgbWV0aG9kOiAnREVMRVRFJyxcclxuICAgICAgICAgICAgaGVhZGVyczoge1xyXG4gICAgICAgICAgICAgICAgJ1gtUmVxdWVzdGVkLVdpdGgnOiAnWE1MSHR0cFJlcXVlc3QnLFxyXG4gICAgICAgICAgICAgICAgJ0NvbnRlbnQtVHlwZSc6ICdhcHBsaWNhdGlvbi9qc29uJ1xyXG4gICAgICAgICAgICB9LFxyXG4gICAgICAgICAgICBib2R5OiBKU09OLnN0cmluZ2lmeSh7J190b2tlbic6IGEuZGF0YXNldC50b2tlbn0pXHJcbiAgICAgICAgfSkudGhlbihyZXNwb25zZSA9PiByZXNwb25zZS5qc29uKCkpXHJcbiAgICAgICAgICAgIC50aGVuKGRhdGEgPT4ge1xyXG4gICAgICAgICAgICAgICAgaWYgKGRhdGEuc3VjY2Vzcykge1xyXG4gICAgICAgICAgICAgICAgICAgIGEucGFyZW50Tm9kZS5wYXJlbnROb2RlLnJlbW92ZUNoaWxkKGEucGFyZW50Tm9kZSlcclxuICAgICAgICAgICAgICAgIH0gZWxzZSB7XHJcbiAgICAgICAgICAgICAgICAgICAgYWxlcnQoZGF0YS5lcnJvcilcclxuICAgICAgICAgICAgICAgIH1cclxuICAgICAgICAgICAgfSlcclxuICAgICAgICAgICAgLmNhdGNoKGUgPT4gYWxlcnQoZSkpXHJcbiAgICB9KVxyXG59KSIsIi8vIGV4dHJhY3RlZCBieSBtaW5pLWNzcy1leHRyYWN0LXBsdWdpbiJdLCJzb3VyY2VSb290IjoiIn0=