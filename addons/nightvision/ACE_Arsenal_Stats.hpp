class EGVAR(arsenal,stats) {
    class statBase;
    class GVAR(generation): statBase {
        scope = 2;
        priority = 1.6;
        condition = QUOTE('nvg' in (getArray ((_this select 1) >> 'visionMode') apply {toLower _x}));
        displayName = CSTRING(NVGeneration);
        showText = 1;
        textStatement = QUOTE(call FUNC(statTextStatement_NVGeneration));
        tabs[] = {{8}, {}};
    };
};
