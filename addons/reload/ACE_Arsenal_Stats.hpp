class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_isBelt: statBase {
        scope = 2;
        priority = -1;
        stats[] = {"ACE_isBelt"};
        displayName = CSTRING(LinkBelt);
        showText = 1;
        textStatement = QUOTE(localize QUOTE(ELSTRING(Common,Enabled)));
        condition = QUOTE(params[ARR_2('_stat','_config')]; (getNumber (_config >> _stat select 0)) == 1);
        tabs[] = {{}, {4}};
    };
};
