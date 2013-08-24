import ceylon.language.model { type }

"Represents a node in the `Document` tree."
see(`ParentNode`, `TextNode`, `Document`)
shared interface Node {

    shared default String tagName {
        variable value tag = type(this).declaration.name;
        if (exists lastDot = tag.lastOccurrence(".")) {
            tag = tag[(lastDot + 1)...];
        }
        return tag.lowercased;
    }

    shared default Tag tag => Tag(tagName);

}

//shared alias HtmlNode => Node|{Node*}|[Node*]|String;

shared alias HtmlNode => Node|{Node*}|[Node*]|Snippet;
