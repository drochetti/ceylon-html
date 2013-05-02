shared interface CardData {

    shared formal String fullName;

    shared default String? honorificPrefix => null;

    shared default String? honorificSuffix => null;

    shared default Boolean hasNameDetails =>
        honorificPrefix exists && honorificSuffix exists;

}