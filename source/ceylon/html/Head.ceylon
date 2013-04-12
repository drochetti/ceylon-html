shared class Head(title = "", stylesheets = {}) satisfies Node {

    shared String title;

    shared {String*} stylesheets;

    shared actual {HtmlNode?*} children = {};
    
}
