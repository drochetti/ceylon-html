import ceylon.html { Div, Node, Snippet }

"Represents a hCard is a simple, open format for publishing people, companies,
 organizations on the web, using a 1:1 representation of vCard (RFC2426)
 properties and values in HTML."
shared class Card(data) satisfies Snippet {

    shared CardData data;

    shared actual Node content =>
        Div {
            classNames = "vcard";
            Div {
                classNames = "fn";
                data.fullName;
            },
            data.hasNameDetails then
                Div {
                    classNames = "n";
                    data.honorificPrefix exists then
                        Div {
                            classNames = "honorific-prefix";
                            data.honorificPrefix else "";
                        },
                    data.honorificSuffix exists then
                        Div {
                            classNames = "honorific-suffix";
                            data.honorificSuffix else "";
                        }
                }
        };
    
}