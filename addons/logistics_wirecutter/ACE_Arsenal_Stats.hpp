class EGVAR(arsenal,stats) {
    class statBase;
    class GVAR(wireCutter): statBase {
        scope = 2;
        priority = -1;
        stats[] = {QGVAR(hasWirecutter)};
        displayName = CSTRING(wirecutterName);
        showText = 1;
        textStatement = QUOTE(localize 'STR_ACE_Common_Yes'); // using localization macros in QUOTE is a PITA
        condition = QUOTE(getNumber (_this select 1 >> (_this select 0) select 0) > 0);
        tabs[] = {{4,5}, {}};
    };
    class GVAR(wireCutterItem): statBase {
        scope = 2;
        priority = -1;
        stats[] = {"ACE_isWirecutter"};
        displayName = CSTRING(wirecutterName);
        showText = 1;
        textStatement = QUOTE(localize 'STR_ACE_Common_Yes'); // using localization macros in QUOTE is a PITA
        condition = QUOTE(getNumber (_this select 1 >> (_this select 0) select 0) > 0);
        tabs[] = {{}, {7}};
    };
};
