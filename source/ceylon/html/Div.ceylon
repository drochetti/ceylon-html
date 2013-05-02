
shared class Div(text = "", String? accessKey = null,
        CssClass classNames = [], String? contextMenu = null,
        String? id = null, Boolean? hidden = null, String? lang = null,
        Boolean? spellcheck = null, String? style = null, String? title = null,
        Boolean? translate = null, children = {})
    extends Element(accessKey, classNames, contextMenu,
        id, hidden, lang, spellcheck, style, title, translate)
    satisfies TextNode & ParentNode {

    shared actual String text;

    shared actual {HtmlNode?*} children;

}