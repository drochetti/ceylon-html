import ceylon.html { allDoctypes, Node, Doctype, Html, Element, TextNode, blockTag, inlineTag, xhtmlDoctypes, CssClass, HtmlNode }

shared abstract class HtmlSerializer(root, doctype = null,
        supportedDoctypes = allDoctypes) {

    shared Node root;

    shared Doctype? doctype;

    shared {Doctype+} supportedDoctypes;

    //shared Boolean isPartial => is Html root;

    variable value indentLevel = 0;

    shared formal void print(String string);

    Boolean prettyPrint = true; // TODO refactor to serializer configuration

    shared void serialize() => visit(root);

    void visit(Node node) {
        if (is Html node) {
            startHtml(node);
        }
        indent();
        openTag(node);
        if (is Element node) {
            visitElement(node);
        }
        endOpenTag(node);
        indentLevel++;
        if (is TextNode node, !node.text.trimmed.empty) {
            linefeed();
            indent();
            print(node.text);
        }
        for (child in node.children) {
            if (exists child) {
                linefeed();
                visitHtmlNode(child);
            }
        }
        indentLevel--;
        if (node.tag.type == blockTag) {
            linefeed();
            indent();
            closeTag(node);
        }
    }

    void startHtml(Html html) {
        print(html.doctype.string);
        linefeed(true);
        linefeed();
    }

    void visitElement(Element node) {
        printAttributes(node);
    }

    void openTag(Node node) => print("<``tagName(node)``");

    void endOpenTag(Node node) {
        if (node.tag.type == inlineTag) {
            if (exists doctype, doctype in xhtmlDoctypes) {
                print("/");
            }
        }
        print(">");
    }

    void closeTag(Node node) => print("</``tagName(node)``>");

    void printAttributes(Element node) {
        printAttribute("id", node.id);
        printCssClassAttribute(node.classNames);
        printAttribute("title", node.title);
        printAttribute("accesskey", node.accessKey);
    }

    void printAttribute(String name, Object? val) {
        if (exists val) {
            print(" ``name``=\"``val``\"");
        }
    }

    void printCssClassAttribute(CssClass classNames) {
        variable String? cls = null;
        switch(classNames)
        case(is String) {
            cls = classNames;
        }
        case(is [String*]) {
            cls = " ".join(classNames);
        }
        if (exists cssClass = cls, !cssClass.trimmed.empty) {
            printAttribute("class", cssClass);
        }
    }

    void visitNodes({Node*} nodes) {
        for (node in nodes) {
            visit(node);
        }
    }

    void visitHtmlNode(HtmlNode node) {
        if (is Node node) {
            visit(node);
        } else if (is {Node*} node) {
            visitNodes(node);
        }
        // TODO use switch-case to exhaust all cases
    }

    String tagName(Node node) => node.tagName.lowercased;

    void linefeed(Boolean force = false) {
        if (prettyPrint || force) {
            print(process.newline);
        }
    }

    void indent() {
        if (prettyPrint) {
            print(indentString);
        }
    }

    String indentString {
        value spaces = indentLevel * 4;
        return spaces > 0 then " ".repeat(spaces) else "";
    }

}