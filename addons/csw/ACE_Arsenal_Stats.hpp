class EGVAR(arsenal,stats) {
    class statBase;
    class GVAR(tripods): statBase {
        scope = 2;
        priority = -1.5;
        displayName = CSTRING(statTripods);
        condition = QUOTE((_this select 1) call FUNC(statTextCondition_tripods));
        showText = 1;
        textStatement = QUOTE((_this select 1) call FUNC(statTextStatement_tripods));
        tabs[] = {{0, 2}, {}};
    };
};
