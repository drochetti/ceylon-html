
shared class Meta(name, content = "") satisfies Node {

    shared String name;

    shared String content;

    tag => Tag(tagName, inlineTag);

}
