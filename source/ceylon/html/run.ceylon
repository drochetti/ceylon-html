import ceylon.html.serializer { HtmlSerializer }
import ceylon.html.microformats { Card, CardData }


class User(fullName) satisfies CardData {
    shared actual String fullName;
}

[User+] users = [User {
    fullName = "Daniel Rochetti";
}, User {
    fullName = "John Doe";
}];

Html layout = Html {
    doctype = html5;
    Head {
        title = "Page Title";
        links = {
            CssLink("http://fonts.googleapis.com/css?family=Open+Sans")
        };
        stylesheets = {};
    };
    Body {
        Div {
            classNames = ["wrapper", "container"];
            Div(
                users.empty then
                    "No users..."
                else
                    "There are ``users.size`` users!"
            ),
            Div {
                id = "users";
                for (i -> user in users.indexed) {
                    Div {
                        id = "user-``i``";
                        Card(user)
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

"Run the module `ceylon.html`."
void run() {
    object consoleSerializer extends HtmlSerializer(layout) {
        print(String string) => process.write(string);
    }
    consoleSerializer.serialize();
}