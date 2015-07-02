/*
 * Author: esteldunedain
 * Initializes the addon module.
 *
 * Arguments:
 * Whatever the module provides.
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

[_logic, QGVAR(enabled),       "SpectatorEnabled"]       call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(limitSide),       "SpectatorPlayerSide"]       call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(AI),       "SpectatorAI"]       call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(tracking), "SpectatorTracking"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(modulePos),      "SpectatorPos"]      call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(endMission),      "SpectatorEnd"]      call EFUNC(common,readSettingFromModule);

if GVAR(modulePos) then {
    GVAR(startingPos) = getPosATL _logic;
    GVAR(startingDir) = getDir _logic;
};