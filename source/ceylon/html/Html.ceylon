""
shared class Html(doctype = html5, head = Head(), body = Body())
        satisfies ParentNode & Document {

    shared actual Doctype doctype;

    shared Head head;

    shared Body body;

    shared actual {HtmlNode?*} children => { head, body };

    shared actual Node root => body;
    
}
