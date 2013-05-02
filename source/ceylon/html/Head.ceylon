import ceylon.io.charset { Charset, utf8 }

shared class Head(title = "", charset = utf8,
        metaContent = {}, stylesheets = {}, scripts = {})
    satisfies ParentNode {

    shared String title;

    shared Charset|String charset;

    shared {Meta?*} metaContent;

    shared {String*} stylesheets;
    //shared {Stylesheet|String*} stylesheets;

    shared {Script*} scripts;

    shared actual {HtmlNode?*} children => {}; // TODO join children (meta, scripts, etc)

}
