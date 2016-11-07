this["MarionetteTree"] =
webpackJsonpMarionetteTree([0],[
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	module.exports = {
	  GridView: __webpack_require__(1),
	  HeaderRowView: __webpack_require__(12),
	  BodyView: __webpack_require__(18),
	  BodyRowView: __webpack_require__(21),
	  BodyRowColumnsView: __webpack_require__(24)
	};


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	var Body, Grid, HeaderRow, Marionette,
	  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
	  hasProp = {}.hasOwnProperty;

	__webpack_require__(2);

	Marionette = __webpack_require__(6);

	HeaderRow = __webpack_require__(12);

	Body = __webpack_require__(18);

	Grid = (function(superClass) {
	  extend(Grid, superClass);

	  function Grid() {
	    return Grid.__super__.constructor.apply(this, arguments);
	  }

	  Grid.prototype.className = function() {
	    return 'grid';
	  };

	  Grid.prototype.template = function() {
	    return '<div class=\'header-region\'></div>\n<div class=\'body-region\'></div>';
	  };

	  Grid.prototype.regions = function() {
	    return {
	      header: '.header-region',
	      body: '.body-region'
	    };
	  };

	  Grid.prototype.headerView = HeaderRow;

	  Grid.prototype.bodyView = Body;

	  Grid.prototype.initialize = function(arg) {
	    var attribute, columns;
	    this.collection = arg.collection, this.columns = arg.columns;
	    if (this.collection.length && !this.columns) {
	      columns = (function() {
	        var i, len, ref, results;
	        ref = this.collection.first().keys();
	        results = [];
	        for (i = 0, len = ref.length; i < len; i++) {
	          attribute = ref[i];
	          results.push({
	            label: attribute,
	            name: attribute
	          });
	        }
	        return results;
	      }).call(this);
	      return this.columns != null ? this.columns : this.columns = new Backbone.Collection(columns);
	    }
	  };

	  Grid.prototype.onRender = function() {
	    this.header.show(new this.headerView({
	      columns: this.columns
	    }));
	    return this.body.show(new this.bodyView({
	      collection: this.collection,
	      columns: this.columns
	    }));
	  };

	  return Grid;

	})(Marionette.LayoutView);

	module.exports = Grid;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag

	// load the styles
	var content = __webpack_require__(3);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(5)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./grid.scss", function() {
				var newContent = require("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./grid.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(4)();
	// imports


	// module
	exports.push([module.id, "", ""]);

	// exports


/***/ },
/* 4 */
/***/ function(module, exports) {

	/*
		MIT License http://www.opensource.org/licenses/mit-license.php
		Author Tobias Koppers @sokra
	*/
	// css base code, injected by the css-loader
	module.exports = function() {
		var list = [];

		// return the list of modules as css string
		list.toString = function toString() {
			var result = [];
			for(var i = 0; i < this.length; i++) {
				var item = this[i];
				if(item[2]) {
					result.push("@media " + item[2] + "{" + item[1] + "}");
				} else {
					result.push(item[1]);
				}
			}
			return result.join("");
		};

		// import a list of modules into the list
		list.i = function(modules, mediaQuery) {
			if(typeof modules === "string")
				modules = [[null, modules, ""]];
			var alreadyImportedModules = {};
			for(var i = 0; i < this.length; i++) {
				var id = this[i][0];
				if(typeof id === "number")
					alreadyImportedModules[id] = true;
			}
			for(i = 0; i < modules.length; i++) {
				var item = modules[i];
				// skip already imported module
				// this implementation is not 100% perfect for weird media query combinations
				//  when a module is imported multiple times with different media queries.
				//  I hope this will never occur (Hey this way we have smaller bundles)
				if(typeof item[0] !== "number" || !alreadyImportedModules[item[0]]) {
					if(mediaQuery && !item[2]) {
						item[2] = mediaQuery;
					} else if(mediaQuery) {
						item[2] = "(" + item[2] + ") and (" + mediaQuery + ")";
					}
					list.push(item);
				}
			}
		};
		return list;
	};


/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	/*
		MIT License http://www.opensource.org/licenses/mit-license.php
		Author Tobias Koppers @sokra
	*/
	var stylesInDom = {},
		memoize = function(fn) {
			var memo;
			return function () {
				if (typeof memo === "undefined") memo = fn.apply(this, arguments);
				return memo;
			};
		},
		isOldIE = memoize(function() {
			return /msie [6-9]\b/.test(window.navigator.userAgent.toLowerCase());
		}),
		getHeadElement = memoize(function () {
			return document.head || document.getElementsByTagName("head")[0];
		}),
		singletonElement = null,
		singletonCounter = 0,
		styleElementsInsertedAtTop = [];

	module.exports = function(list, options) {
		if(false) {
			if(typeof document !== "object") throw new Error("The style-loader cannot be used in a non-browser environment");
		}

		options = options || {};
		// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
		// tags it will allow on a page
		if (typeof options.singleton === "undefined") options.singleton = isOldIE();

		// By default, add <style> tags to the bottom of <head>.
		if (typeof options.insertAt === "undefined") options.insertAt = "bottom";

		var styles = listToStyles(list);
		addStylesToDom(styles, options);

		return function update(newList) {
			var mayRemove = [];
			for(var i = 0; i < styles.length; i++) {
				var item = styles[i];
				var domStyle = stylesInDom[item.id];
				domStyle.refs--;
				mayRemove.push(domStyle);
			}
			if(newList) {
				var newStyles = listToStyles(newList);
				addStylesToDom(newStyles, options);
			}
			for(var i = 0; i < mayRemove.length; i++) {
				var domStyle = mayRemove[i];
				if(domStyle.refs === 0) {
					for(var j = 0; j < domStyle.parts.length; j++)
						domStyle.parts[j]();
					delete stylesInDom[domStyle.id];
				}
			}
		};
	}

	function addStylesToDom(styles, options) {
		for(var i = 0; i < styles.length; i++) {
			var item = styles[i];
			var domStyle = stylesInDom[item.id];
			if(domStyle) {
				domStyle.refs++;
				for(var j = 0; j < domStyle.parts.length; j++) {
					domStyle.parts[j](item.parts[j]);
				}
				for(; j < item.parts.length; j++) {
					domStyle.parts.push(addStyle(item.parts[j], options));
				}
			} else {
				var parts = [];
				for(var j = 0; j < item.parts.length; j++) {
					parts.push(addStyle(item.parts[j], options));
				}
				stylesInDom[item.id] = {id: item.id, refs: 1, parts: parts};
			}
		}
	}

	function listToStyles(list) {
		var styles = [];
		var newStyles = {};
		for(var i = 0; i < list.length; i++) {
			var item = list[i];
			var id = item[0];
			var css = item[1];
			var media = item[2];
			var sourceMap = item[3];
			var part = {css: css, media: media, sourceMap: sourceMap};
			if(!newStyles[id])
				styles.push(newStyles[id] = {id: id, parts: [part]});
			else
				newStyles[id].parts.push(part);
		}
		return styles;
	}

	function insertStyleElement(options, styleElement) {
		var head = getHeadElement();
		var lastStyleElementInsertedAtTop = styleElementsInsertedAtTop[styleElementsInsertedAtTop.length - 1];
		if (options.insertAt === "top") {
			if(!lastStyleElementInsertedAtTop) {
				head.insertBefore(styleElement, head.firstChild);
			} else if(lastStyleElementInsertedAtTop.nextSibling) {
				head.insertBefore(styleElement, lastStyleElementInsertedAtTop.nextSibling);
			} else {
				head.appendChild(styleElement);
			}
			styleElementsInsertedAtTop.push(styleElement);
		} else if (options.insertAt === "bottom") {
			head.appendChild(styleElement);
		} else {
			throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");
		}
	}

	function removeStyleElement(styleElement) {
		styleElement.parentNode.removeChild(styleElement);
		var idx = styleElementsInsertedAtTop.indexOf(styleElement);
		if(idx >= 0) {
			styleElementsInsertedAtTop.splice(idx, 1);
		}
	}

	function createStyleElement(options) {
		var styleElement = document.createElement("style");
		styleElement.type = "text/css";
		insertStyleElement(options, styleElement);
		return styleElement;
	}

	function createLinkElement(options) {
		var linkElement = document.createElement("link");
		linkElement.rel = "stylesheet";
		insertStyleElement(options, linkElement);
		return linkElement;
	}

	function addStyle(obj, options) {
		var styleElement, update, remove;

		if (options.singleton) {
			var styleIndex = singletonCounter++;
			styleElement = singletonElement || (singletonElement = createStyleElement(options));
			update = applyToSingletonTag.bind(null, styleElement, styleIndex, false);
			remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true);
		} else if(obj.sourceMap &&
			typeof URL === "function" &&
			typeof URL.createObjectURL === "function" &&
			typeof URL.revokeObjectURL === "function" &&
			typeof Blob === "function" &&
			typeof btoa === "function") {
			styleElement = createLinkElement(options);
			update = updateLink.bind(null, styleElement);
			remove = function() {
				removeStyleElement(styleElement);
				if(styleElement.href)
					URL.revokeObjectURL(styleElement.href);
			};
		} else {
			styleElement = createStyleElement(options);
			update = applyToTag.bind(null, styleElement);
			remove = function() {
				removeStyleElement(styleElement);
			};
		}

		update(obj);

		return function updateStyle(newObj) {
			if(newObj) {
				if(newObj.css === obj.css && newObj.media === obj.media && newObj.sourceMap === obj.sourceMap)
					return;
				update(obj = newObj);
			} else {
				remove();
			}
		};
	}

	var replaceText = (function () {
		var textStore = [];

		return function (index, replacement) {
			textStore[index] = replacement;
			return textStore.filter(Boolean).join('\n');
		};
	})();

	function applyToSingletonTag(styleElement, index, remove, obj) {
		var css = remove ? "" : obj.css;

		if (styleElement.styleSheet) {
			styleElement.styleSheet.cssText = replaceText(index, css);
		} else {
			var cssNode = document.createTextNode(css);
			var childNodes = styleElement.childNodes;
			if (childNodes[index]) styleElement.removeChild(childNodes[index]);
			if (childNodes.length) {
				styleElement.insertBefore(cssNode, childNodes[index]);
			} else {
				styleElement.appendChild(cssNode);
			}
		}
	}

	function applyToTag(styleElement, obj) {
		var css = obj.css;
		var media = obj.media;
		var sourceMap = obj.sourceMap;

		if(media) {
			styleElement.setAttribute("media", media)
		}

		if(styleElement.styleSheet) {
			styleElement.styleSheet.cssText = css;
		} else {
			while(styleElement.firstChild) {
				styleElement.removeChild(styleElement.firstChild);
			}
			styleElement.appendChild(document.createTextNode(css));
		}
	}

	function updateLink(linkElement, obj) {
		var css = obj.css;
		var media = obj.media;
		var sourceMap = obj.sourceMap;

		if(sourceMap) {
			// http://stackoverflow.com/a/26603875
			css += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + " */";
		}

		var blob = new Blob([css], { type: "text/css" });

		var oldSrc = linkElement.href;

		linkElement.href = URL.createObjectURL(blob);

		if(oldSrc)
			URL.revokeObjectURL(oldSrc);
	}


/***/ },
/* 6 */,
/* 7 */,
/* 8 */,
/* 9 */,
/* 10 */,
/* 11 */,
/* 12 */
/***/ function(module, exports, __webpack_require__) {

	var DefaultHeaderCell, HeaderRow, Marionette,
	  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
	  hasProp = {}.hasOwnProperty;

	__webpack_require__(13);

	Marionette = __webpack_require__(6);

	DefaultHeaderCell = __webpack_require__(15);

	HeaderRow = (function(superClass) {
	  extend(HeaderRow, superClass);

	  function HeaderRow() {
	    return HeaderRow.__super__.constructor.apply(this, arguments);
	  }

	  HeaderRow.prototype.className = function() {
	    return 'header-row';
	  };

	  HeaderRow.prototype.childView = DefaultHeaderCell;

	  HeaderRow.prototype.getChildView = function(column) {
	    var ref;
	    return (ref = column.get('headerCell')) != null ? ref : this.childView;
	  };

	  HeaderRow.prototype.sort = false;

	  HeaderRow.prototype.initialize = function(arg) {
	    this.columns = arg.columns;
	    return this.collection = this.columns;
	  };

	  return HeaderRow;

	})(Marionette.CollectionView);

	module.exports = HeaderRow;


/***/ },
/* 13 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag

	// load the styles
	var content = __webpack_require__(14);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(5)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./header-row.scss", function() {
				var newContent = require("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./header-row.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 14 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(4)();
	// imports


	// module
	exports.push([module.id, ".header-row {\n  display: flex; }\n", ""]);

	// exports


/***/ },
/* 15 */
/***/ function(module, exports, __webpack_require__) {

	var Marionette, StringCell, _,
	  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
	  hasProp = {}.hasOwnProperty;

	__webpack_require__(16);

	Marionette = __webpack_require__(6);

	_ = __webpack_require__(8);

	StringCell = (function(superClass) {
	  extend(StringCell, superClass);

	  function StringCell() {
	    return StringCell.__super__.constructor.apply(this, arguments);
	  }

	  StringCell.prototype.className = function() {
	    return 'header-cells-string-cell';
	  };

	  StringCell.prototype.template = _.template('<%- label %>');

	  StringCell.prototype.templateHelpers = function() {
	    return {
	      label: this.model.get('label')
	    };
	  };

	  return StringCell;

	})(Marionette.ItemView);

	module.exports = StringCell;


/***/ },
/* 16 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag

	// load the styles
	var content = __webpack_require__(17);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(5)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../../node_modules/css-loader/index.js!./../../../node_modules/sass-loader/index.js!./string-cell.scss", function() {
				var newContent = require("!!./../../../node_modules/css-loader/index.js!./../../../node_modules/sass-loader/index.js!./string-cell.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 17 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(4)();
	// imports


	// module
	exports.push([module.id, ".header-cells-string-cell {\n  flex-grow: 1;\n  flex-basis: 0; }\n", ""]);

	// exports


/***/ },
/* 18 */
/***/ function(module, exports, __webpack_require__) {

	var Body, BodyRow, Marionette,
	  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
	  hasProp = {}.hasOwnProperty;

	__webpack_require__(19);

	Marionette = __webpack_require__(6);

	BodyRow = __webpack_require__(21);

	Body = (function(superClass) {
	  extend(Body, superClass);

	  function Body() {
	    return Body.__super__.constructor.apply(this, arguments);
	  }

	  Body.prototype.className = function() {
	    return 'body';
	  };

	  Body.prototype.childView = BodyRow;

	  Body.prototype.childViewOptions = function(model) {
	    return {
	      columns: this.columns,
	      model: model,
	      collection: model.get('collection'),
	      bodyView: this.constructor
	    };
	  };

	  Body.prototype.sort = false;

	  Body.prototype.initialize = function(arg) {
	    this.columns = arg.columns, this.collection = arg.collection;
	  };

	  return Body;

	})(Marionette.CollectionView);

	module.exports = Body;


/***/ },
/* 19 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag

	// load the styles
	var content = __webpack_require__(20);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(5)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./body.scss", function() {
				var newContent = require("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./body.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 20 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(4)();
	// imports


	// module
	exports.push([module.id, "", ""]);

	// exports


/***/ },
/* 21 */
/***/ function(module, exports, __webpack_require__) {

	var BodyRow, BodyRowColumns, Marionette,
	  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
	  hasProp = {}.hasOwnProperty;

	__webpack_require__(22);

	Marionette = __webpack_require__(6);

	BodyRowColumns = __webpack_require__(24);

	BodyRow = (function(superClass) {
	  extend(BodyRow, superClass);

	  function BodyRow() {
	    return BodyRow.__super__.constructor.apply(this, arguments);
	  }

	  BodyRow.prototype.className = function() {
	    return 'body-row';
	  };

	  BodyRow.prototype.template = function() {
	    return '<div class=\'body-row-columns-region\'></div>\n<div class=\'body-region\'></div>';
	  };

	  BodyRow.prototype.regions = function() {
	    return {
	      columnsView: '.body-row-columns-region',
	      body: '.body-region'
	    };
	  };

	  BodyRow.prototype.initialize = function(arg) {
	    this.columns = arg.columns, this.model = arg.model, this.collection = arg.collection, this.bodyView = arg.bodyView;
	  };

	  BodyRow.prototype.onRender = function() {
	    this.columnsView.show(new BodyRowColumns({
	      columns: this.columns,
	      model: this.model
	    }));
	    return this.body.show(new this.bodyView({
	      collection: this.collection,
	      columns: this.columns
	    }));
	  };

	  return BodyRow;

	})(Marionette.LayoutView);

	module.exports = BodyRow;


/***/ },
/* 22 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag

	// load the styles
	var content = __webpack_require__(23);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(5)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./body-row.scss", function() {
				var newContent = require("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./body-row.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 23 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(4)();
	// imports


	// module
	exports.push([module.id, "", ""]);

	// exports


/***/ },
/* 24 */
/***/ function(module, exports, __webpack_require__) {

	var BodyRowColumns, DefaultCell, Marionette,
	  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
	  hasProp = {}.hasOwnProperty;

	__webpack_require__(25);

	Marionette = __webpack_require__(6);

	DefaultCell = __webpack_require__(27);

	BodyRowColumns = (function(superClass) {
	  extend(BodyRowColumns, superClass);

	  function BodyRowColumns() {
	    return BodyRowColumns.__super__.constructor.apply(this, arguments);
	  }

	  BodyRowColumns.prototype.className = function() {
	    return 'body-row-columns';
	  };

	  BodyRowColumns.prototype.childView = DefaultCell;

	  BodyRowColumns.prototype.getChildView = function(column) {
	    var ref;
	    if (column.get('cells')) {
	      return this.constructor;
	    } else {
	      return (ref = column.get('cell')) != null ? ref : this.childView;
	    }
	  };

	  BodyRowColumns.prototype.childViewOptions = function(column) {
	    var columns;
	    if (column.get('cells')) {
	      columns = new Backbone.Collection(column.get('cells'));
	      return {
	        columns: columns,
	        model: this.model
	      };
	    } else {
	      return {
	        column: column,
	        model: this.model
	      };
	    }
	  };

	  BodyRowColumns.prototype.sort = false;

	  BodyRowColumns.prototype.initialize = function(arg) {
	    this.columns = arg.columns, this.model = arg.model;
	    return this.collection = this.columns;
	  };

	  return BodyRowColumns;

	})(Marionette.CollectionView);

	module.exports = BodyRowColumns;


/***/ },
/* 25 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag

	// load the styles
	var content = __webpack_require__(26);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(5)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./body-row-columns.scss", function() {
				var newContent = require("!!./../../node_modules/css-loader/index.js!./../../node_modules/sass-loader/index.js!./body-row-columns.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 26 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(4)();
	// imports


	// module
	exports.push([module.id, ".body-row-columns {\n  display: flex;\n  flex-grow: 1;\n  flex-basis: 0; }\n", ""]);

	// exports


/***/ },
/* 27 */
/***/ function(module, exports, __webpack_require__) {

	var Marionette, StringCell, _,
	  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
	  hasProp = {}.hasOwnProperty;

	__webpack_require__(28);

	Marionette = __webpack_require__(6);

	_ = __webpack_require__(8);

	StringCell = (function(superClass) {
	  extend(StringCell, superClass);

	  function StringCell() {
	    return StringCell.__super__.constructor.apply(this, arguments);
	  }

	  StringCell.prototype.className = function() {
	    return 'cells-string-cell';
	  };

	  StringCell.prototype.template = _.template('<%- text %>');

	  StringCell.prototype.templateHelpers = function() {
	    return {
	      text: this.model.get(this.column.get('name'))
	    };
	  };

	  StringCell.prototype.initialize = function(arg) {
	    this.model = arg.model, this.column = arg.column;
	  };

	  return StringCell;

	})(Marionette.ItemView);

	module.exports = StringCell;


/***/ },
/* 28 */
/***/ function(module, exports, __webpack_require__) {

	// style-loader: Adds some css to the DOM by adding a <style> tag

	// load the styles
	var content = __webpack_require__(29);
	if(typeof content === 'string') content = [[module.id, content, '']];
	// add the styles to the DOM
	var update = __webpack_require__(5)(content, {});
	if(content.locals) module.exports = content.locals;
	// Hot Module Replacement
	if(false) {
		// When the styles change, update the <style> tags
		if(!content.locals) {
			module.hot.accept("!!./../../../node_modules/css-loader/index.js!./../../../node_modules/sass-loader/index.js!./string-cell.scss", function() {
				var newContent = require("!!./../../../node_modules/css-loader/index.js!./../../../node_modules/sass-loader/index.js!./string-cell.scss");
				if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
				update(newContent);
			});
		}
		// When the module is disposed, remove the <style> tags
		module.hot.dispose(function() { update(); });
	}

/***/ },
/* 29 */
/***/ function(module, exports, __webpack_require__) {

	exports = module.exports = __webpack_require__(4)();
	// imports


	// module
	exports.push([module.id, ".cells-string-cell {\n  flex-grow: 1;\n  flex-basis: 0; }\n", ""]);

	// exports


/***/ }
]);