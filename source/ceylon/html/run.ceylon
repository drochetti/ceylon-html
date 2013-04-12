import ceylon.html.serializer { HtmlSerializer }

[String+] users = ["Daniel", "John", "Doe"];

Html layout = Html {
    doctype = html5;
    Head {
        title = "Page Title";
        stylesheets = {};
    };
    Body {
        Div {
            classNames = ["wrapper", "container"];
            Div {
                users.empty then
                    Div("No users...")
                else
                    Div("There are ``users.size`` users!")
            },
            Div {
                id = "users";
                for (i -> user in users.indexed) {
                    Div {
                        "``i``: ``user``";
                        id = "user-``i``";
                    }
                }
            },
            users.size > 1 then
                Div {
                    "``users.size`` records";
                    classNames = "pagination";
                }
        }
    };
};

doc "Run the module `ceylon.html`."
void run() {
    object consoleSerializer extends HtmlSerializer(layout) {
        print(String string) => process.write(string);
    }
    consoleSerializer.serialize();
}