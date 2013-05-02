
doc ""
by "Daniel Rochetti"
shared class Html(doctype = html5, head = Head(), body = Body())
        satisfies ParentNode {

    shared Doctype doctype;

    shared Head head;

    shared Body body;

    shared actual {HtmlNode?*} children => { head, body };
    
}
