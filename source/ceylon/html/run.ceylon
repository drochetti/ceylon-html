import ceylon.html.serializer { HtmlSerializer }

Html layout = Html {
    doctype = xhtml1Strict;
    Head {
        title = "Page Title";
        stylesheets = {};
    };
    Body {
        Div {
            classNames = ["wrapper", "container"];
            Div {
                id = "profile";
            }
        }
    };
};

doc "Run the module `drochetti.html2`."
void run() {
    print("html2");
    object consoleSerializer extends HtmlSerializer(layout) {
        print(String string) => process.write(string);
    }
    consoleSerializer.serialize();
}