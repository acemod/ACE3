#include "..\script_component.hpp"
/*
 * Author: PabstMirror, Dystopian
 * Gets magazine that the player can carry, suitable to vehicle magazine
 *
 * Arguments:
 * 0: Vehicle Magazine <STRING>
 *
 * Return Value:
 * Carry Magazine <STRING>
 *
 * Example:
 * "1Rnd_GAT_missiles" call ace_csw_fnc_getCarryMagazine
 *
 * Public: No
 */

params ["_vehicleMag"];

private _carryMag = GVAR(vehicleMagCache) get _vehicleMag;
if (isNil "_carryMag") then {
    private _groups = "getNumber (_x >> _vehicleMag) == 1 && {isClass (configFile >> 'CfgMagazines' >> configName _x)}" configClasses (configFile >> QGVAR(groups));
    _carryMag = configName (_groups param [0, configNull]);
    GVAR(vehicleMagCache) set [_vehicleMag, _carryMag];
    TRACE_2("setting cache",_vehicleMag,_carryMag);
};

_carryMag
