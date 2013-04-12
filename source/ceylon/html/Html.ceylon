import ceylon.collection { LinkedList }


shared class Html(doctype = html5, head = Head(), body = Body()) satisfies Node {

    shared Doctype doctype;

    shared Head head;

    shared Body body;

    shared actual {HtmlNode?*} children => { head, body };
    
}

HtmlNode? unless(Boolean test, HtmlNode result) {
    if (test) {
        return null;
    } else {
        return result;
    }
}

//HtmlNode when({<Boolean->HtmlNode>*}|[Boolean, HtmlNode] testsAndResults) {
HtmlNode? when({<Boolean->HtmlNode>*} testsAndResults) {
    value nodes = LinkedList<Node>();
    //switch(testsAndResults)
    //case(is [Boolean, HtmlNode]) {
    //    
    //}
    //case(is {<Boolean->HtmlNode>*}) {
    //    
    //}
    //for (test->result in testsAndResults) {
    //    // TODO identify the result and flat them into the nodes list
    //}
    return null;
}
