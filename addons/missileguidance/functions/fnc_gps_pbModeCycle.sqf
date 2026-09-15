#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Cycle pre-briefed mission mode
 *
 * Arguments:
 * Direction <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call ace_missileguidance_fnc_gps_pbModeCycle
 *
 * Public: No
 */
params ["_direction"];
private _display = uiNamespace getVariable QGVAR(gpsAttackOptionDisplay);

[GVAR(gps_pbMode)] call FUNC(gps_saveAttackSettings);

if (_direction > 0) then {
    // right
    GVAR(gps_pbMode) = (GVAR(gps_pbMode) + 1) % MAX_PB_MODES
} else {
    // left
    GVAR(gps_pbMode) = (GVAR(gps_pbMode) - 1);
    if (GVAR(gps_pbMode) < 0) then {
        GVAR(gps_pbMode) = MAX_PB_MODES - 1;
    };
    GVAR(gps_pbMode) = GVAR(gps_pbMode) % MAX_PB_MODES;
};

[GVAR(gps_pbMode)] call FUNC(gps_loadAttackSettings);
(_display displayCtrl GPS_UI_PB_MISSION) ctrlSetText format ["%1 %2", localize LSTRING(GPS_ui_pp_short), GVAR(gps_pbMode) + 1];

