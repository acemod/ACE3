/*
 * Author: Garth 'L-H' de Wet
 * Initialises the player object for the explosive system.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
if !(hasInterface) exitWith {};
GVAR(PlacedCount) = 0;
GVAR(Setup) = objNull;
GVAR(pfeh_running) = false;
GVAR(CurrentSpeedDial) = 0;

//Cancel placement if interact menu opened
["interactMenuOpened", {
    if (GVAR(pfeh_running) && {!isNull (GVAR(Setup))}) then {
        call FUNC(place_Cancel)
    };
}] call EFUNC(common,addEventHandler);

[{(_this select 0) call FUNC(handleScrollWheel);}] call EFUNC(Common,addScrollWheelEventHandler);
player addEventHandler ["Killed", {
    private "_deadman";
    call FUNC(place_Cancel);
    _deadman = [(_this select 0), "DeadManSwitch"] call FUNC(getPlacedExplosives);
    {
        [(_this select 0), -1, _x, true] call FUNC(detonateExplosive);
    } count _deadman;
}];
player addEventHandler ["Take", {
    private ["_item", "_getter", "_giver", "_config", "_detonators"];
    _item = _this select 2;
    _getter = _this select 0;
    _giver = _this select 1;

    _config = ConfigFile >> "CfgWeapons" >> _item;
    if (isClass _config && {getNumber(_config >> "ACE_Detonator") == 1}) then {
        private ["_clackerItems"];
        _clackerItems = _giver getVariable [QGVAR(Clackers), []];
        _getter SetVariable [QGVAR(Clackers), (_getter getVariable [QGVAR(Clackers), []]) + _clackerItems, true];

        _detonators = [_giver] call FUNC(getDetonators);
        if (count _detonators == 0) then {
            _giver setVariable [QGVAR(Clackers), nil, true];
        };
    };
}];
player addEventHandler ["Put", {
    private ["_item", "_getter", "_giver", "_config"];
    _item = _this select 2;
    _getter = _this select 1;
    _giver = _this select 0;

    _config = ConfigFile >> "CfgWeapons" >> _item;
    if (isClass _config && {getNumber(_config >> "ACE_Detonator") == 1}) then {
        private ["_clackerItems"];
        _clackerItems = _giver getVariable [QGVAR(Clackers), []];
        _getter SetVariable [QGVAR(Clackers), (_getter getVariable [QGVAR(Clackers), []]) + _clackerItems, true];

        _detonators = [_giver] call FUNC(getDetonators);
        if (count _detonators == 0) then {
            _giver setVariable [QGVAR(Clackers), nil, true];
        };
    };
}];
