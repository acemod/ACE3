class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_backblastAngle: statBase {
        scope = 2;
        priority = 2;
        stats[] = {QGVAR(angle)};
        displayName = CSTRING(statBackblastAngle);
        showText = 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; format [ARR_2('%1°', getNumber (_config >> _stat select 0))]);
        tabs[] = {{2}, {}};
    };
    class ACE_backblastRange: statBase {
        scope = 2;
        priority = 1;
        stats[] = {QGVAR(range)};
        displayName = CSTRING(statBackblastRange);
        showText = 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; private _blastRangeStat = getNumber (_config >> _stat select 0); format [ARR_3('%1m (%2ft)', _blastRangeStat, (_blastRangeStat / 0.3048) toFixed 1)]);
        tabs[] = {{2}, {}};
    };
};
