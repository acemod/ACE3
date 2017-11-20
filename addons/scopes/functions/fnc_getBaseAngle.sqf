/*
 * Author: Ruthberg
 * Gets the base angle of the currently used weapon & optic combination
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon index <NUMBER>
 * 2: Weapon <CLASS>
 * 3: Optic <CLASS>
 *
 * Return Value:
 * base angle <NUMBER>
 *
 * Example:
 * [player, 0, "srifle_LRR_F", "optic_LRPS"] call ace_scopes_fnc_getBaseAngle
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_player", "_weaponIndex", "_weaponClass", "_opticsClass"];

private _weaponConfig = configFile >> "CfgWeapons" >> _weaponClass;
private _baseAngle = DEFAULT_IRON_SIGHT_BASE_ANGLE + getNumber(_weaponConfig >> "ACE_IronSightBaseAngle");

if (_opticsClass != "") then {
    if (isNumber (_weaponConfig >> "ACE_RailBaseAngle")) then {
        _baseAngle = getNumber(_weaponConfig >> "ACE_RailBaseAngle");
    } else {
        _baseAngle = DEFAULT_RAIL_BASE_ANGLE;
    };
};

_baseAngle
