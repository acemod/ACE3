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
    //[_logic, QGVAR(modeSelectiveUAV), "modeSelectiveUAV"] call EFUNC(common,readSettingFromModule); // Disabled - Reference comment in FUNC(canChangeCamera)

    ACE_LOGINFO_5("View Restriction Module Initialized. Mode: %1 (Foot: %2, Land: %3, Air: %4, Sea: %5)",GVAR(mode),GVAR(modeSelectiveFoot),GVAR(modeSelectiveLand), GVAR(modeSelectiveAir),GVAR(modeSelectiveSea));
} else {
    ACE_LOGINFO_1("View Restriction Module Initialized. Mode: %1",GVAR(mode));
};
