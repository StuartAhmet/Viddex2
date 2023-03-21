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
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
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
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/stuart/code/Viddex-vol-two/app/javascript/packs/application.js: Identifier 'bootstrap' has already been declared. (19:12)\n\n  17 | })\n  18 |\n> 19 | import * as bootstrap from 'bootstrap'\n     |             ^\n  20 | import \"../stylesheets/application\"\n  21 |\n  22 | document.addEventListener(\"DOMContentLoaded\", function(event) {\n    at instantiate (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:653:32)\n    at constructor (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:947:12)\n    at Parser.raise (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:3261:19)\n    at ScopeHandler.checkRedeclarationInScope (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:1557:19)\n    at ScopeHandler.declareName (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:1528:12)\n    at Parser.declareNameFromIdentifier (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:7535:16)\n    at Parser.checkIdentifier (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:7531:12)\n    at Parser.checkLVal (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:7470:12)\n    at Parser.finishImportSpecifier (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:14073:10)\n    at Parser.parseImportSpecifierLocal (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:14070:31)\n    at Parser.maybeParseStarImportSpecifier (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:14175:12)\n    at Parser.parseImport (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:14042:41)\n    at Parser.parseStatementContent (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:12651:27)\n    at Parser.parseStatementLike (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:12544:17)\n    at Parser.parseModuleItem (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:12521:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:13116:36)\n    at Parser.parseBlockBody (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:13109:10)\n    at Parser.parseProgram (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:12435:10)\n    at Parser.parseTopLevel (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:12425:25)\n    at Parser.parse (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:14245:10)\n    at parse (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/parser/lib/index.js:14286:38)\n    at parser (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/core/lib/parser/index.js:41:34)\n    at parser.next (<anonymous>)\n    at normalizeFile (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/core/lib/transformation/normalize-file.js:64:38)\n    at normalizeFile.next (<anonymous>)\n    at run (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/core/lib/transformation/index.js:21:50)\n    at run.next (<anonymous>)\n    at transform (/Users/stuart/code/Viddex-vol-two/node_modules/@babel/core/lib/transform.js:22:41)\n    at transform.next (<anonymous>)\n    at step (/Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:261:32)\n    at /Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:273:13\n    at async.call.result.err.err (/Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:223:11)\n    at /Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:189:28\n    at /Users/stuart/code/Viddex-vol-two/node_modules/@babel/core/lib/gensync-utils/async.js:68:7\n    at /Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:113:33\n    at step (/Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:287:14)\n    at /Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:273:13\n    at async.call.result.err.err (/Users/stuart/code/Viddex-vol-two/node_modules/gensync/index.js:223:11)");

/***/ })

/******/ });
//# sourceMappingURL=application-0425d9067a8e90027a22.js.map