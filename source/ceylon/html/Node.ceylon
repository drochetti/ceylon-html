doc ""
by "Daniel Rochetti"
shared interface Node {

    shared default String tagName {
        variable value tag = className(this);
        if (exists lastDot = tag.lastOccurrence(":")) {
            tag = tag[(lastDot + 1)...];
        }
        return tag;
    }

    shared default Tag tag => Tag(tagName);

    shared formal {HtmlNode?*} children;

}

//shared alias HtmlNode => Node|{Node*}|[Node*]|String;

shared alias HtmlNode => Node|{Node*}|[Node*];

//shared alias Nodes => {HtmlNode?*};