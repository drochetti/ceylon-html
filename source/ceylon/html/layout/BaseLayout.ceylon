import ceylon.html { HtmlNode, Html, html5, Head, Meta, Body, Div, Script }
import ceylon.io.charset { utf8 }

"A simple HTML5 boilerplate layout."
shared abstract class BaseLayout() satisfies Layout {

    "The page title."
    shared formal String title;

    "The page meta description."
    shared default String description = "";

    shared default {Script*} headScripts = {};

    shared default {String*} stylesheets = {};

    "The page body _block_."
    shared formal HtmlNode body;

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
            stylesheets = join({
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

// TODO remove - just testing how code would look

interface View {
    shared formal Html|Layout render();
}

class IndexView(/*Model*/) satisfies View {
    
    shared actual Html|Layout render() {
        object index extends BaseLayout() {
            title = "Home";
            
            body => Div {
                "Welcome to the Home page!";
            };
        }
        return index;
    }

}
