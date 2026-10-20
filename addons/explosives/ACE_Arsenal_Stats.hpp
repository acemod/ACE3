class EGVAR(arsenal,stats) {
    class statBase {};
    class ACE_explosiveRange: statBase {
        scope = 2;
        priority = 1;
        stats[] = {QGVAR(Range)};
        displayName = CSTRING(statExploRange);
        showText = 1;
        textStatement = QUOTE(params [ARR_2('_stat','_config')]; private _exploRangeStat = getNumber (_config >> _stat select 0); format [ARR_3('%1m (%2ft)',_exploRangeStat,(_exploRangeStat / 0.3048) toFixed 1)]);
        condition = QUOTE(getNumber (_this select 1 >> QQGVAR(detonator)) > 0);
        tabs[] = {{}, {7}};
    };
};
