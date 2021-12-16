(function(window) {
    var IE_VERSION = function() {
            return void 0 === window.ActiveXObject ? null : !document.querySelector ? 7 : !document.addEventListener ? 8 : !window.atob ? 9 : !document.__proto__ ? 10 : 11
        }(),
        STATUS = {
            OK: "OK",
            ERROR: "ERROR",
            ZERO_RESULT: "ZERO_RESULT"
        },
        SORT_BY = {
            ACCURACY: "accuracy",
            DISTANCE: "distance"
        },
        COORDS = {
            TM: "TM",
            WGS84: "WGS84",
            WTM: "WTM",
            CONGNAMUL: "CONGNAMUL",
            WCONGNAMUL: "WCONGNAMUL"
        },
        ANALYZE_TYPE = {
            SIMILAR: "similar",
            EXACT: "exact"
        },
        SECURE = "https:" == window.location.protocol,
        PROTOCOL = SECURE ? "https:" : "http:",
        DOMAIN = PROTOCOL + "//dapi.kakao.com",
        URL = {
            GEO: DOMAIN + "/v2/local/geo/",
            SEARCH: DOMAIN + "/v2/local/search/"
        },
        ERROR_MESSAGE = {
            MISSING_ARGUMENTS: "\ub9e4\uac1c\ubcc0\uc218\uac00 \ub204\ub77d\ub418\uc5c8\uc2b5\ub2c8\ub2e4: ",
            APIKEY_REQUIRED: "Daum Maps API \ub97c \uc704\ud55c apikey \uac00 \uc874\uc7ac\ud558\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4: apikey\uac00 \ud544\uc694\ud569\ub2c8\ub2e4.",
            NOT_FOUND_NAMESPACE: "daum.maps \ub124\uc784\uc2a4\ud398\uc774\uc2a4\ub97c \ucc3e\uc744 \uc218 \uc5c6\uc2b5\ub2c8\ub2e4: Daum Maps Javascript Open API\ub97c \uba3c\uc800 \ub85c\ub4dc\ud558\uc2ed\uc2dc\uc624."
        },
        DAUM_MAPS = function(b) {
            var a;
            if((a = b.daum) && (a = a.maps)) return a;
            throw Error(ERROR_MESSAGE.NOT_FOUND_NAMESPACE);
        }(window),
        APP_KEY = DAUM_MAPS.apikey,
        APP_VERSION = DAUM_MAPS.version,
        KA_HEADER_STRING = "sdk/" + APP_VERSION + " os/javascript lang/" + (navigator.userLanguage || navigator.language) + " device/" + navigator.platform.replace(/ /g, "_") + " origin/" + encodeURIComponent(location.protocol + "//" + location.hostname + (location.port ? ":" + location.port : "")),
        AUTH_HEADER_STRING = "KakaoAK " + APP_KEY,
        AUTH_PARAM_STRING = "appkey=" + APP_KEY + "&version=" + APP_VERSION;
    var Util = {
        extend: function(b) {
            for(var a = 1; a < arguments.length; a++) {
                var c = arguments[a];
                if(void 0 !== c && null !== c)
                    for(var d in c) c.hasOwnProperty(d) && (b[d] = c[d])
            }
            return b
        },
        update: function(b) {
            for(var a = 1; a < arguments.length; a++) {
                var c = arguments[a];
                if(void 0 !== c && null !== c)
                    for(var d in c) c.hasOwnProperty(d) && d in b && (b[d] = c[d])
            }
            return b
        },
        serialize: function(b) {
            var a = [],
                c, d;
            for(d in b) c = b[d], void 0 !== c && null !== c && a.push(encodeURIComponent(d) + "=" + encodeURIComponent(c));
            return a.join("&")
        },
        toLatLng: function(b) {
            return b instanceof
            daum.maps.Coords ? b.toLatLng() : b
        }
    };
    var Ajax = !IE_VERSION || 9 < IE_VERSION ? function(b) {
        var a = new XMLHttpRequest;
        a.open("GET", b.url + "?" + Util.serialize(b.params), !0);
        a.setRequestHeader("KA", KA_HEADER_STRING);
        a.setRequestHeader("Authorization", AUTH_HEADER_STRING);
        a.onreadystatechange = function() {
            if(4 === a.readyState)
                if(200 === a.status) b.oncomplete(JSON.parse(a.responseText));
                else b.onerror()
        };
        a.send()
    } : function(b) {
        var a = new XDomainRequest,
            c = AUTH_PARAM_STRING + "&" + Util.serialize(b.params);
        a.onload = function() {
            b.oncomplete(JSON.parse(a.responseText))
        };
        a.onerror = b.onerror;
        a.open("GET", b.url + "?" + c);
        setTimeout(function() {
            a.send()
        }, 0)
    };

    function RequestFactory(b, a, c) {
        return function(d) {
            Util.update(a, d);
            Ajax({
                url: b,
                params: a,
                oncomplete: function(b) {
                    c(b, a)
                },
                onerror: function() {
                    c()
                }
            })
        }
    };

    function AddressSearch(b, a) {
        return RequestFactory(URL.SEARCH + "address.json", {
            query: b,
            page: 1,
            size: 10,
            analyze_type: null
        }, a)
    };

    function Coord2RegionCode(b, a, c) {
        return RequestFactory(URL.GEO + "coord2regioncode.json", {
            x: b,
            y: a,
            input_coord: null,
            output_coord: null
        }, c)
    };

    function Coord2Address(b, a, c) {
        return RequestFactory(URL.GEO + "coord2address.json", {
            x: b,
            y: a,
            input_coord: null
        }, c)
    };

    function TransCoord(b, a, c) {		//console.log(c);
        return RequestFactory(URL.GEO + "transcoord.json", {
            x: b,
            y: a,
            input_coord: null,
            output_coord: null
        }, c)
    };

    function KeywordSearch(b, a) {
        return RequestFactory(URL.SEARCH + "keyword.json", {
            query: b,
            category_group_code: null,
            x: null,
            y: null,
            radius: null,
            rect: null,
            page: 1,
            size: 15,
            sort: null
        }, a)
    };

    function CategorySearch(b, a) {
        return RequestFactory(URL.SEARCH + "category.json", {
            category_group_code: b,
            x: null,
            y: null,
            radius: null,
            rect: null,
            page: 1,
            size: 15,
            sort: null
        }, a)
    };

    function Pagination(b, a, c) {
        function d(b) {
            a.page = b;
            c(a)
        }
        var h = a.page,
            b = Number(b.pageable_count),
            g = a.size,
            e = Math.ceil(b / g);
        this.totalCount = b;
        this.hasNextPage = h < e;
        this.hasPrevPage = 1 < h && h <= e;
        this.first = 1;
        this.current = h;
        this.last = e;
        this.perPage = g;
        this.nextPage = function() {
            this.hasNextPage && d(h + 1)
        };
        this.prevPage = function() {
            this.hasPrevPage && d(h - 1)
        };
        this.gotoPage = function(a) {
            a = Number(a);
            0 < a && (a <= e && a !== h) && d(a)
        };
        this.gotoFirst = function() {
            d(1)
        };
        this.gotoLast = function() {
            d(e)
        }
    };

    function Geocoder() {
        this.addressSearch = function(b, a, c) {
            var d = AddressSearch(b, function(b, c) {
                var e, f;
                b ? (f = b.documents, e = 0 === f.length ? STATUS.ZERO_RESULT : STATUS.OK, a(f, e, new Pagination(b.meta, c, d))) : a(STATUS.ERROR, null, null)
            });
            d(c)
        };
        this.coord2RegionCode = function(b, a, c, d) {
            Coord2RegionCode(b, a, function(a) {
                a ? (a = a.documents, c(a, STATUS.OK)) : c(STATUS.ERROR, null, null)
            })(d)
        };
        this.coord2Address = function(b, a, c, d) {
            Coord2Address(b, a, function(a) {
                var b;
                a ? (b = a.documents, a = 0 === b.length ? STATUS.ZERO_RESULT : STATUS.OK, c(b, a)) : c(STATUS.ERROR, null, null)
            })(d)
        };
        this.transCoord = function(b, a, c, d, pId, bx, by) {	//console.log(d);
            TransCoord(b, a, function(a) {
                var b;
                a ? (b = a.documents, a = 0 === b.length ? STATUS.ZERO_RESULT : STATUS.OK, c(b, a, pId, bx, by)) : c(STATUS.ERROR, null, null)
            })(d)
        }
    };

    function Places(b) {
        function a(a) {
            var b = Util.toLatLng(a.getSouthWest()),
                a = Util.toLatLng(a.getNorthEast());
            return {
                rect: b.getLng() + "," + b.getLat() + "," + a.getLng() + "," + a.getLat()
            }
        }

        function c(a) {
            a = Util.toLatLng(a);
            return {
                x: a.getLng(),
                y: a.getLat()
            }
        }
        var d = b;
        this.setMap = function(a) {
            d = a
        };
        this.keywordSearch = function(b, g, e) {
            e = e || {};
            e.location && Util.extend(e, c(e.location));
            e.bounds && Util.extend(e, a(e.bounds));
            d && (e.useMapCenter && Util.extend(e, c(d.getCenter())), e.useMapBounds && Util.extend(e, a(d.getBounds())));
            var f = KeywordSearch(b, function(a, b) {
                var c, d;
                if(a) {
                    d = a.documents;
                    c = d.length === 0 ? STATUS.ZERO_RESULT : STATUS.OK;
                    g(d, c, new Pagination(a.meta, b, f))
                } else g(STATUS.ERROR, null, null)
            });
            f(e)
        };
        this.categorySearch = function(b, g, e) {
            e = e || {};
            e.location && Util.extend(e, c(e.location));
            e.bounds && Util.extend(e, a(e.bounds));
            d && (e.useMapCenter && Util.extend(e, c(d.getCenter())), e.useMapBounds && Util.extend(e, a(d.getBounds())));
            var f = CategorySearch(b, function(a, b) {
                var c, d;
                if(a) {
                    d = a.documents;
                    c = d.length === 0 ? STATUS.ZERO_RESULT : STATUS.OK;
                    g(d, c, new Pagination(a.meta, b, f))
                } else g(STATUS.ERROR, null, null)
            });
            f(e)
        }
    };
    var w = window,
        w = w.daum = w.daum || {},
        w = w.maps = w.maps || {},
        w = w.services = w.services || {};
    w.Status = STATUS;
    w.SortBy = SORT_BY;
    w.Coords = COORDS;
    w.AnalyzeType = ANALYZE_TYPE;
    w.Places = Places;
    w.Geocoder = Geocoder;
})(window);