
doc "Represents a HTML element. An `Element` consists of a tag name,
     some atributes and children nodes."
by "Daniel Rochetti"
shared abstract class Element(accessKey = null, classNames = [],
        contextMenu = null, id = null,
        hidden = null, lang = null, spellcheck = null, title = null,
        translate = null, children = {}) satisfies Node {

    doc "Specifies a shortcut key that can be used to access the element."
    shared String? accessKey; // TODO static typed KeyStroke?

    shared CssClass classNames;

    shared String? contextMenu;

    doc "Document wide identifier. The value should be the name of the id
         you wish to use and must be unique for the whole document."
    shared String? id;

    doc "Indicates that the element is not yet, or is no longer, relevant.
         The browser/user agent does not display elements that have the
         hidden attribute present."
    shared Boolean? hidden;

    shared String? lang; // TODO Locale type?

    shared Boolean? spellcheck;

    doc "Specifies a title. Most browsers will display a tooltip when the
         cursor hovers over the element"
    shared String? title;

    shared Boolean? translate;

    shared actual {HtmlNode?*} children;

}

shared alias CssClass => String|[String*];
