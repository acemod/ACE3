class EGVAR(arsenal,stats) {
    class statBase {};
    class GVAR(entrenchingTool): statBase {
        scope = 2;
        priority = -1;
        stats[] = {QGVAR(entrenchingTool)};
        displayName = CSTRING(EntrenchingToolName);
        showText = 1;
        textStatement = QUOTE(localize QUOTE(ELSTRING(common,yes)));
        condition = QUOTE(getNumber (_this select 1 >> (_this select 0) select 0) > 0);
        tabs[] = {{0,1,4,5}, {7}};
    };
};
