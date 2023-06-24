class EGVAR(arsenal,stats) {
    class statBase;
    class GVAR(entrenchingTool): statBase {
        scope = 2;
        priority = -1;
        stats[] = {QGVAR(entrenchingTool)};
        displayName = CSTRING(EntrenchingToolName);
        showText = 1;
        textStatement = QUOTE(localize 'STR_ACE_Common_Yes'); // using localization macros in QUOTE is a PITA
        condition = QUOTE(getNumber (_this select 1 >> (_this select 0) select 0) > 0);
        tabs[] = {{0,1,5}, {7}};
    };
};
