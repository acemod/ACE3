class EGVAR(arsenal,stats) {
    class statBase;
    class GVAR(breathing_protection): statBase {
        scope = 2;
        displayName = CSTRING(statBreatingProtection);
        showBar = 1;
        condition = QUOTE(getNumber (_this select 1 >> QQGVAR(Breathing_Protection)) > 0);
        barStatement = QUOTE(getNumber (_this select 1 >> QQGVAR(Breathing_Protection)));
        tabs[] = {{7}, {}};
    };

    class GVAR(eyes_protection): statBase {
        scope = 2;
        displayName = CSTRING(statEyesProtection);
        showBar = 1;
        condition = QUOTE(getNumber (_this select 1 >> QQGVAR(Eyes_Protection)) > 0);
        barStatement = QUOTE(getNumber (_this select 1 >> QQGVAR(Eyes_Protection)));
        tabs[] = {{7}, {}};
    };
};
