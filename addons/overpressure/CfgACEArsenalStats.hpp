class CfgACEArsenalStats {
    class statBase;
    class backblastAngle: statBase {
        scope = 2;
        priority = 2;
        stats[]= {"ace_overpressure_angle"};
        displayName= CSTRING(statBackblastAngle);
        showText= 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; format [ARR_2('%1°', getNumber (_config >> _stat select 0))]);
        tabs[]= {{2}, {}};
    };
    class backblastRange: statBase {
        scope = 2;
        priority = 1;
        stats[]= {"ace_overpressure_range"};
        displayName= CSTRING(statBackblastRange);
        showText= 1;
        textStatement = QUOTE(params [ARR_2('_stat', '_config')]; private _blastRangeStat = getNumber (_config >> _stat select 0); format [ARR_3('%1m (%2ft)', _blastRangeStat, (_blastRangeStat / 0.3048) toFixed 1)]);
        tabs[]= {{2}, {}};
    };
};
