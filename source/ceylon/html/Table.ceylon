
shared alias TableElements => THead|TBody|TFoot;

shared class Table(header = {}, rows = {}, footer = {})
        satisfies ParentNode<TableElements> & BlockElement {

    shared {Th?*} header;

    shared {Tr?*} rows;

    shared {Tr?*} footer;

    shared actual {<TableElements|{TableElements*}|Null>*} children
            => { THead(header), TBody(rows), TFoot(footer) };

}

"Represents the header element of the HTML table."
shared class THead({Th?*} headers = {})
        satisfies ParentNode<Tr> & TableElement {

    shared actual {Tr?*} children => { Tr(headers) };

}

"Represents the body element of the HTML table."
shared class TBody({Tr?*} rows = {})
        satisfies ParentNode<Tr> & TableElement {

    shared actual {Tr?*} children = rows;

}

"Represents the footer element of the HTML table."
shared class TFoot({Tr?*} rows = {})
        satisfies ParentNode<Tr> & TableElement {

    shared actual {Tr?*} children = rows;

}

shared class Tr(children = {})
        satisfies ParentNode<Th|Td> & TableElement {

    shared actual {Th|Td?*} children;

}

shared class Th(text = "", children = {})
        satisfies TextNode & ParentNode<BlockElement> & TableElement {

    shared actual String text;

    shared actual {<BlockElement|{BlockElement*}?>*} children;

}

shared class Td(text = "", children = {})
        satisfies TextNode & ParentNode<BlockElement> & TableElement {

    shared actual String text;

    shared actual {<BlockElement|{BlockElement*}?>*} children;

}
