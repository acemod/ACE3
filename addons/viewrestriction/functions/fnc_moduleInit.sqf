/*
 * Author: Jonpas
 * Initializes the View Restriction module.
 *
 * Arguments:
 * 0: logic <OBJECT>
 * 1: Synchronised Units <ARRAY>
 * 2: Module Activated <BOOL>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(mode), "mode"] call EFUNC(common,readSettingFromModule);

// Read selective options only if selective mode selected
if (GVAR(mode) == 3) then {
    [_logic, QGVAR(modeSelectiveFoot), "modeSelectiveFoot"] call EFUNC(common,readSettingFromModule);
    [_logic, QGVAR(modeSelectiveLand), "modeSelectiveLand"] call EFUNC(common,readSettingFromModule);
    [_logic, QGVAR(modeSelectiveAir), "modeSelectiveAir"] call EFUNC(common,readSettingFromModule);
    [_logic, QGVAR(modeSelectiveSea), "modeSelectiveSea"] call EFUNC(common,readSettingFromModule);
    // Disabled - Reference comment in FUNC(canChangeCamera)
    //[_logic, QGVAR(modeSelectiveUAV), "modeSelectiveUAV"] call EFUNC(common,readSettingFromModule);

    diag_log text format["[ACE]: View Restriction Module Initialized with mode: %1 (Foot: %2, Land: %3, Air: %4, Sea: %5, UAV: %6)", GVAR(mode), GVAR(modeSelectiveFoot), GVAR(modeSelectiveLand), GVAR(modeSelectiveAir), GVAR(modeSelectiveSea), /*GVAR(modeSelectiveUAV)*/ "N/A"];
} else {
    diag_log text format["[ACE]: View Restriction Module Initialized with mode: %1", GVAR(mode)];
};
