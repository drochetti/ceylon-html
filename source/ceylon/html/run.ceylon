import ceylon.html.serializer {
    consoleSerializer
}


class User(name) {
    shared String name;
}

[User+] users = [User {
    name = "Daniel Rochetti";
}, User {
    name = "John Doe";
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
            Table {
                //id = "users";
                header = {
                    Th("#"),
                    Th("Name")
                };
                for (i -> user in users.indexed)
                    Tr {
                        Td(i.string),
                        Td(user.name)
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
    consoleSerializer.serialize(layout);
}