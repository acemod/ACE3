#include "..\script_component.hpp"
/*
 * Author: PabstMirror, Dystopian
 * Gets magazine that the player can carry, suitable to vehicle magazine.
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

params [["_vehicleMag", "", [""]]];

if (_vehicleMag == "") exitWith {""};

// Config lookups are case-insensitive but hashmap keys are not, so normalise before caching.
// A magazine with no carry equivalent caches "" on purpose, so the miss costs nothing to look up again
GVAR(vehicleMagCache) getOrDefaultCall [toLowerANSI _vehicleMag, {
    private _groups = "getNumber (_x >> _vehicleMag) == 1 && {isClass (configFile >> 'CfgMagazines' >> configName _x)}" configClasses (configFile >> QGVAR(groups));
    private _carryMag = configName (_groups param [0, configNull]);
    TRACE_2("setting cache",_vehicleMag,_carryMag);

    _carryMag
}, true] // return
