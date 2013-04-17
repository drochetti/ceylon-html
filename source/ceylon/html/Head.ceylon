import ceylon.io.charset { Charset, utf8 }

shared class Head(title = "", charset = utf8,
        metaContent = {}, stylesheets = {}) satisfies Node {

    shared String title;

    shared Charset|String charset;

    shared {Meta*} metaContent;

    shared {String*} stylesheets;

    shared actual {HtmlNode?*} children = {};
    
}
