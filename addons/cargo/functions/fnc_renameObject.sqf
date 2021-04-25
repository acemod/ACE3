#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
/*
 * Author: JasperRab
 * Shows rename UI and renames object once completed.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crate_7] call ace_cargo_fnc_renameObject
 *
 * Public: Yes
 */

params ["_target"];

private _display = findDisplay IDD_MISSION createDisplay "RscDisplayEmpty";
_display displayAddEventHandler ["Unload", {
    params ["_display", "_exitCode"];
    if (_exitCode isEqualTo 1) then { // only set if pressed on the Save button
        private _ctrlEdit = (((allControls _display) select {ctrlClassName _x isEqualTo "RscEdit"}) select 0);
        private _ctrlEditText = ctrlText _ctrlEdit;
        private _target = _ctrlEdit getVariable [QGVAR(renameTarget), objNull];
        [[LSTRING(renamedObject), _ctrlEditText], 3] call EFUNC(common,displayTextStructured);
        _target setVariable [QGVAR(customName), _ctrlEditText, true];
    };
}];

// add Background
private _ctrlBackground = _display ctrlCreate ["RscStructuredText", -1];
_ctrlBackground ctrlSetStructuredText parseText (["<t size=1 align='center'>", localize LSTRING(renameObjectUI), "</t>"] joinString "");
_ctrlBackground ctrlSetBackgroundColor [0, 0, 0, 0.5];
_ctrlBackground ctrlSetPosition [
    safeZoneX + 0.4 * safeZoneW - 0.025,
    safeZoneY + 0.3 * safeZoneH - 0.025,
    safeZoneW * 0.2 + 0.05,
    safeZoneH * 0.04 + 0.05
];
_ctrlBackground ctrlCommit 0;

// add Edit Field
private _ctrlEdit = _display ctrlCreate ["RscEdit", -1];
_ctrlEdit ctrlSetText (_target getVariable [QGVAR(customName), ""]);
_ctrlEdit ctrlSetBackgroundColor [0, 0, 0, 1];
_ctrlEdit ctrlSetPosition [
    safeZoneX + 0.4 * safeZoneW,
    safeZoneY + 0.3 * safeZoneH + 0.02,
    safeZoneW * 0.2,
    safeZoneH * 0.03
];
_ctrlEdit setVariable [QGVAR(renameTarget), _target];
_ctrlEdit ctrlCommit 0;

// add Save Button
private _ctrlButton = _display ctrlCreate ["RscButton", 1]; // 1 = Ok btn
_ctrlButton ctrlSetText localize ELSTRING(Common,Save);
_ctrlButton ctrlSetPosition [
    safeZoneX + 0.4 * safeZoneW - 0.025,
    safeZoneY + 0.3 * safeZoneH + (safeZoneH * 0.04 + 0.04),
    safeZoneW * 0.2 + 0.05,
    safeZoneH * 0.03
];
_ctrlButton ctrlCommit 0;
