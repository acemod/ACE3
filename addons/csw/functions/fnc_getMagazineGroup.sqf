#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * The vehicle magazines a carry magazine can be loaded as, with how much each holds.
 *
 * Pure config, so it is read once per carry magazine and kept for the session. Callers pick from the
 * result rather than walking the magazine groups themselves.
 *
 * Arguments:
 * 0: Carry magazine <STRING>
 *
 * Return Value:
 * Vehicle magazines <ARRAY>
 *   0: Classname <STRING>
 *   1: Ammo <NUMBER>
 *
 * Example:
 * "ACE_csw_100Rnd_127x99_mag" call ace_csw_fnc_getMagazineGroup
 *
 * Public: No
 */

params [["_carryMag", "", [""]]];

if (_carryMag == "") exitWith {[]};

GVAR(magGroupCache) getOrDefaultCall [_carryMag, {
    private _cfgMagazines = configFile >> "CfgMagazines";

    (configProperties [configFile >> QGVAR(groups) >> _carryMag, "getNumber _x == 1", false]) apply {
        private _vehicleMag = configName _x;

        [_vehicleMag, getNumber (_cfgMagazines >> _vehicleMag >> "count")]
    }
}, true] // return
