/*
 * Author: PabstMirror
 * Gets possible magazines that can be added to a pylon.
 *
 * Arguments:
 * 0: Pylon config <CONFIG>
 *
 * Return Value:
 * Magazines <ARRAY>
 *
 * Example:
 * [config] call ace_rearm_fnc_getHardpointMagazines
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_pylonConfig"];

private _return = GVAR(hardpointGroupsCache) getVariable (str _pylonConfig);
if (isNil "_return") then {
    _return = [];
    private _hardpoints = (getArray (_pylonConfig >> "hardpoints")) apply {toLower _x};
    private _maxWeight = if (isNumber (_pylonConfig >> "maxWeight")) then {getNumber (_pylonConfig >> "maxWeight")} else {1e5};
    private _mags = configProperties [configFile >> "CfgMagazines", "(isClass _x) && {isArray (_x >> 'hardpoints')}"];
    {
        if ((getNumber (_x >> "mass")) < _maxWeight) then {
            private _magHardpoints = (getArray (_x >> "hardpoints")) apply {toLower _x};
            if (!((_hardpoints arrayIntersect _magHardpoints) isEqualTo [])) then {
                _return pushBack configName _x;
            };
        };
    } forEach _mags;
    if ((str _pylonConfig) != "") then {
        GVAR(hardpointGroupsCache) setVariable [(str _pylonConfig), _return];
    };
};

_return;
