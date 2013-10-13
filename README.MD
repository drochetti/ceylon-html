ceylon-html
===========

A Ceylon SDK module that empower the developer to write HTML using only the Ceylon language and hence taking full advantage of all its features.
Because of its expressiveness and it's friendly object instantiation syntax that allows developers to easily define tree-like structures, ceylon-html makes dynamic HTML generation easy and fast. That means there's no need for a "templating engine" and all its issues (mixing HTML and dynamic language, introducing new/akward constructs, loosing static typing, etc).

Basic static example:
```ceylon
Html html = Html {
    doctype = html5;

    Head {
        title = "Welcome | Ceylon";
    };

    Body {
        Header {
            H1("Welcome to Ceylon")
        },
        P {
            "Hey ``name``! Do you know Ceylon already?";
            classNames = "question";
        },
        P {
            "No, but it reads very clear!";
            classNames = "answer";
        },
        Footer("Running on ``process.vm`` version ``process.vmVersion``")
    };
};
```

Some clear outcomes from this simple example:
  - Type-safe and clean HTML templating
  - Blueprint enforced. 
  - Easily extendable. Well, since we are alking about a OO language and not another template engine. This means the 
  - The footer code shows not only how a static type string interpolation comes for free, but it means **it can run both on server and on client**. Yes, it can be used for templating both on server server (JVM, NodeJS) and on client side (JS on Browser).