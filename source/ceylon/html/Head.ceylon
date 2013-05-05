import ceylon.io.charset { Charset, utf8 }

"Groups the metadata of the `Html` document, such as page description,
 links to resources, stylesheets and scripts."
shared class Head(title = "", charset = utf8,
        metaContent = {}, links = {},
        stylesheets = {}, scripts = {})
    satisfies ParentNode {

    "Defines the title of the document, shown in a
     browser's title bar or tab"
    shared String title;

    "The document `Charset` definition."
    shared Charset|String charset;

    shared {Meta?*} metaContent;

    shared {Link?*} links;

    shared {String*} stylesheets;
    //shared {Stylesheet|String*} stylesheets;

    shared {Script*} scripts;

    // TODO join children (meta, scripts, etc)
    shared actual {HtmlNode?*} children => join(metaContent, scripts);

}
