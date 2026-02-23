class EGVAR(arsenal,stats) {
    class statBase {};
    class ADDON: statBase {
        scope = 2;
        priority = 0;
        stats[] = {};
        displayName = CSTRING(wardrobeModifiable);
        showBar = 0;
        showText = 1;
        textStatement = QUOTE(localize QUOTE(ELSTRING(common,yes)));
        condition = QUOTE((_this select 1) call FUNC(isModifiable));
        tabs[] = {{3,4,5,6}, {}};
    };
};
