/*
 * Author: Ruthberg
 *
 * Calculates the retardation of the bullet
 *
 * Arguments:
 * 0: drag model - integer 1-7 <NUMBER>
 * 1: drag coefficient - bc <NUMBER>
 * 2: velocity - m/s <NUMBER>
 *
 * Return Value:
 * retardation - m/(s^2) <NUMBER>
 *
 * Example:
 * [5, 20, 10] call ace_advanced_ballistics_fnc_calculateRetardation
 *
 * Public: No
 */
#include "script_component.hpp"

// Source: GNU Exterior Ballistics

private ["_A", "_M"];
params ["_dragModel", "_dragCoefficient", "_velocity"];
_velocity = _velocity * 3.2808399;

switch _dragModel do {
    case 1: {
        call {
            if (_velocity > 4230) exitWith { _A = 0.0001477404177730177; _M = 1.9565; };
            if (_velocity > 3680) exitWith { _A = 0.0001920339268755614; _M = 1.925; };
            if (_velocity > 3450) exitWith { _A = 0.0002894751026819746; _M = 1.875; };
            if (_velocity > 3295) exitWith { _A = 0.0004349905111115636; _M = 1.825; };
            if (_velocity > 3130) exitWith { _A = 0.0006520421871892662; _M = 1.775; };
            if (_velocity > 2960) exitWith { _A = 0.0009748073694078696; _M = 1.725; };
            if (_velocity > 2830) exitWith { _A = 0.001453721560187286; _M = 1.675; };
            if (_velocity > 2680) exitWith { _A = 0.002162887202930376; _M = 1.625; };
            if (_velocity > 2460) exitWith { _A = 0.003209559783129881; _M = 1.575; };
            if (_velocity > 2225) exitWith { _A = 0.003904368218691249; _M = 1.55; };
            if (_velocity > 2015) exitWith { _A = 0.003222942271262336; _M = 1.575; };
            if (_velocity > 1890) exitWith { _A = 0.002203329542297809; _M = 1.625; };
            if (_velocity > 1810) exitWith { _A = 0.001511001028891904; _M = 1.675; };
            if (_velocity > 1730) exitWith { _A = 0.0008609957592468259; _M = 1.75; };
            if (_velocity > 1595) exitWith { _A = 0.0004086146797305117; _M = 1.85; };
            if (_velocity > 1520) exitWith { _A = 0.0001954473210037398; _M = 1.95; };
            if (_velocity > 1420) exitWith { _A = 0.00005431896266462351; _M = 2.125; };
            if (_velocity > 1360) exitWith { _A = 0.000008847742581674416; _M = 2.375; };
            if (_velocity > 1315) exitWith { _A = 0.000001456922328720298; _M = 2.625; };
            if (_velocity > 1280) exitWith { _A = 0.0000002419485191895565; _M = 2.875; };
            if (_velocity > 1220) exitWith { _A = 0.00000001657956321067612; _M = 3.25; };
            if (_velocity > 1185) exitWith { _A = 0.0000000004745469537157371; _M = 3.75; };
            if (_velocity > 1150) exitWith { _A = 0.00000000001379746590025088; _M = 4.25; };
            if (_velocity > 1100) exitWith { _A = 0.0000000000004070157961147882; _M = 4.75; };
            if (_velocity > 1060) exitWith { _A = 0.00000000000002938236954847331; _M = 5.125; };
            if (_velocity > 1025) exitWith { _A = 0.00000000000001228597370774746; _M = 5.25; };
            if (_velocity >  980) exitWith { _A = 0.00000000000002916938264100495; _M = 5.125; };
            if (_velocity >  945) exitWith { _A = 0.0000000000003855099424807451; _M = 4.75; };
            if (_velocity >  905) exitWith { _A = 0.00000000001185097045689854; _M = 4.25; };
            if (_velocity >  860) exitWith { _A = 0.0000000003566129470974951; _M = 3.75; };
            if (_velocity >  810) exitWith { _A = 0.00000001045513263966272; _M = 3.25; };
            if (_velocity >  780) exitWith { _A = 0.0000001291159200846216; _M = 2.875; };
            if (_velocity >  750) exitWith { _A = 0.0000006824429329105383; _M = 2.625; };
            if (_velocity >  700) exitWith { _A = 0.000003569169672385163; _M = 2.375; };
            if (_velocity >  640) exitWith { _A = 0.00001839015095899579; _M = 2.125; };
            if (_velocity >  600) exitWith { _A = 0.00005711174688734240; _M = 1.950; };
            if (_velocity >  550) exitWith { _A = 0.00009226557091973427; _M = 1.875; };
            if (_velocity >  250) exitWith { _A = 0.00009337991957131389; _M = 1.875; };
            if (_velocity >  100) exitWith { _A = 0.00007225247327590413; _M = 1.925; };
            if (_velocity >   65) exitWith { _A = 0.00005792684957074546; _M = 1.975; };
            if (_velocity >    0) exitWith { _A = 0.00005206214107320588; _M = 2.000; };
        };
    };
    case 2: {
        call {
            if (_velocity > 1674) exitWith { _A = 0.0079470052136733; _M = 1.36999902851493; };
            if (_velocity > 1172) exitWith { _A = 0.00100419763721974; _M = 1.65392237010294; };
            if (_velocity > 1060) exitWith { _A = 0.0000000000000000000000715571228255369; _M = 7.91913562392361; };
            if (_velocity >  949) exitWith { _A = 0.000000000139589807205091; _M = 3.81439537623717; };
            if (_velocity >  670) exitWith { _A = 0.000234364342818625; _M = 1.71869536324748; };
            if (_velocity >  335) exitWith { _A = 0.000177962438921838; _M = 1.76877550388679; };
            if (_velocity >    0) exitWith { _A = 0.0000518033561289704; _M = 1.98160270524632; };
        };
    };
    case 5: {
        call {
            if (_velocity > 1730) exitWith { _A = 0.00724854775171929; _M = 1.41538574492812; };
            if (_velocity > 1228) exitWith { _A = 0.0000350563361516117; _M = 2.13077307854948; };
            if (_velocity > 1116) exitWith { _A = 0.000000000000184029481181151; _M = 4.81927320350395; };
            if (_velocity > 1004) exitWith { _A = 0.000000000000000000000134713064017409; _M = 7.8100555281422; };
            if (_velocity >  837) exitWith { _A = 0.000000103965974081168; _M = 2.84204791809926; };
            if (_velocity >  335) exitWith { _A = 0.0001093015938698234; _M = 1.81096361579504; };
            if (_velocity >    0) exitWith { _A = 0.0000351963178524273; _M = 2.00477856801111; };
        };
    };
    case 6: {
        call {
            if (_velocity > 3236) exitWith { _A = 0.0455384883480781; _M = 1.15997674041274; };
            if (_velocity > 2065) exitWith { _A = 0.07167261849653769; _M = 1.10704436538885; };
            if (_velocity > 1311) exitWith { _A = 0.00166676386084348; _M = 1.60085100195952; };
            if (_velocity > 1144) exitWith { _A = 0.000000101482730119215; _M = 2.9569674731838; };
            if (_velocity > 1004) exitWith { _A = 0.00000000000000000431542773103552; _M = 6.34106317069757; };
            if (_velocity >  670) exitWith { _A = 0.0000204835650496866; _M = 2.11688446325998; };
            if (_velocity >    0) exitWith { _A = 0.0000750912466084823; _M = 1.92031057847052; };
        };
    };
    case 7: {
        call {
            if (_velocity > 4200) exitWith { _A = 0.00000000129081656775919; _M = 3.24121295355962; };
            if (_velocity > 3000) exitWith { _A = 0.0171422231434847; _M = 1.27907168025204; };
            if (_velocity > 1470) exitWith { _A = 0.00233355948302505; _M = 1.52693913274526; };
            if (_velocity > 1260) exitWith { _A = 0.000797592111627665; _M = 1.67688974440324; };
            if (_velocity > 1110) exitWith { _A = 0.00000000000571086414289273; _M = 4.3212826264889; };
            if (_velocity >  960) exitWith { _A = 0.0000000000000000302865108244904; _M = 5.99074203776707; };
            if (_velocity >  670) exitWith { _A = 0.00000752285155782535; _M = 2.1738019851075; };
            if (_velocity >  540) exitWith { _A = 0.0000131766281225189; _M = 2.08774690257991; };
            if (_velocity >    0) exitWith { _A = 0.0000134504843776525; _M = 2.08702306738884; };
        };
    };
    case 8: {
        call {
            if (_velocity > 3571) exitWith { _A = 0.0112263766252305; _M = 1.33207346655961; };
            if (_velocity > 1841) exitWith { _A = 0.0167252613732636; _M = 1.28662041261785; };
            if (_velocity > 1120) exitWith { _A = 0.00220172456619625; _M = 1.55636358091189; };
            if (_velocity > 1088) exitWith { _A = 0.00000000000000020538037167098; _M = 5.80410776994789; };
            if (_velocity >  976) exitWith { _A = 0.00000000000592182174254121; _M = 4.29275576134191; };
            if (_velocity >    0) exitWith { _A = 0.000043917343795117; _M = 1.99978116283334; };
        };
    };
};

if (!isNil "_A" && !isNil "_M" && _velocity > 0 && _velocity < 10000) then {
    (_A * (_velocity ^ _M) / _dragCoefficient) / 3.2808399
} else {
    0
};
