import ceylon.html {
    HtmlNode,
    Html,
    html5,
    Head,
    Meta,
    Body,
    Div,
    Script
}
import ceylon.io.charset {
    utf8
}

"A simple HTML5 boilerplate layout."
shared class BaseLayout(title, body = Div()) satisfies Layout {

    "The page title."
    shared String title;

    "The page meta description."
    shared default String description = "";

    shared default {Script*} headScripts = {};

    shared default {String*} stylesheets = {};

    "The page body _block_."
    shared HtmlNode body;

    shared default {Script*} bodyScripts = {};

    shared default HtmlNode footer => {};

    html => Html {

        doctype = html5;

        Head {
            title = title;
            charset = utf8;
            metaContent = {
                Meta("description", description)
            };
            stylesheets = concatenate({
            }, stylesheets);
            scripts = headScripts;
        };

        Body {
            body,
            Div {
                id = "footer";
                footer
            },
            bodyScripts
        };

    };

}
