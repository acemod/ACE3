/*
 * Author: GitHawk
 * Sets the supply count. [Global Effects]
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Supply Count <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, 1000] call ace_rearm_fnc_setSupplyCount
 *
 * Public: Yes
 */
#include "script_component.hpp"

if !(EGVAR(common,settingsInitFinished)) exitWith { // only run this after the settings are initialized
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(setSupplyCount), _this];
};

params [["_truck", objNull, [objNull]], ["_supply", 0, [0]]];

if (GVAR(supply) != 1) exitWith {WARNING("supply setting is not set to limited");};
if (isNull _truck) exitWith {WARNING_1("Truck is null [%1]",_truck);};

_truck setVariable [QGVAR(currentSupply), (_supply max 0), true];
