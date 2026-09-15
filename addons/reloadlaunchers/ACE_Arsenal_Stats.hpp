class EGVAR(arsenal,stats) {
    class statBase {};
    class ADDON: statBase {
        scope = 2;
        priority = -1;
        stats[] = {QGVAR(enabled)};
        displayName = CSTRING(featureDescription);
        showText = 1;
        textStatement = QUOTE(localize QUOTE(ELSTRING(Common,Enabled)));
        condition = QUOTE(params[ARR_2('_stat','_config')]; (getNumber (_config >> _stat select 0)) == 1);
        tabs[] = {{2}, {}};
    };
};
