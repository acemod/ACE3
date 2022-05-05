#include "script_component.hpp"
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

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QXGVAR(mode), "mode"] call EFUNC(common,readSettingFromModule);

// Read selective options only if selective mode selected
if (XGVAR(mode) == 3) then {
    [_logic, QXGVAR(modeSelectiveFoot), "modeSelectiveFoot"] call EFUNC(common,readSettingFromModule);
    [_logic, QXGVAR(modeSelectiveLand), "modeSelectiveLand"] call EFUNC(common,readSettingFromModule);
    [_logic, QXGVAR(modeSelectiveAir), "modeSelectiveAir"] call EFUNC(common,readSettingFromModule);
    [_logic, QXGVAR(modeSelectiveSea), "modeSelectiveSea"] call EFUNC(common,readSettingFromModule);
    //[_logic, QGVAR(modeSelectiveUAV), "modeSelectiveUAV"] call EFUNC(common,readSettingFromModule); // Disabled - Reference comment in FUNC(canChangeCamera)

    INFO_5("View Restriction Module Initialized. Mode: %1 (Foot: %2, Land: %3, Air: %4, Sea: %5)",XGVAR(mode),XGVAR(modeSelectiveFoot),XGVAR(modeSelectiveLand),XGVAR(modeSelectiveAir),XGVAR(modeSelectiveSea));
} else {
    INFO_1("View Restriction Module Initialized. Mode: %1",XGVAR(mode));
};
