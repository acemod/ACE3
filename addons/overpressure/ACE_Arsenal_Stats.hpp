class EGVAR(arsenal,stats) {
    class statBase {};
    class ACE_backblastAngle: statBase {
        scope = 2;
        priority = 1.7;
        stats[] = {};
        displayName = CSTRING(statBackblastAngle);
        showText = 1;
        textStatement = QUOTE(format [ARR_2('%1°',getNumber ((_this select 1) >> QQGVAR(angle)))]);
        condition = QUOTE(call EFUNC(arsenal,statCondition_isWeapon));
        tabs[] = {{2}, {}};
    };
    class ACE_backblastRange: statBase {
        scope = 2;
        priority = 1.6;
        displayName = CSTRING(statBackblastRange);
        showText = 1;
        textStatement = QUOTE(private _blastRangeStat = getNumber ((_this select 1) >> QQGVAR(range)); format [ARR_3('%1m (%2ft)',_blastRangeStat,(_blastRangeStat / 0.3048) toFixed 1)]);
        condition = QUOTE(call EFUNC(arsenal,statCondition_isWeapon));
        tabs[] = {{2}, {}};
    };
};
