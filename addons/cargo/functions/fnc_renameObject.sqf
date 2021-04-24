#include "script_component.hpp"
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

GVAR(renameTarget) = _target;

disableSerialization;
private _display = findDisplay 46 createDisplay "RscDisplayEmpty";
_display displayAddEventHandler ["Unload", {
    params ["_display", "_exitCode"];
        if (_exitCode isEqualTo 1) then { // only set if pressed on "Ok" the button
        private _ctrlText = ctrlText (((allControls _display) select {ctrlClassName _x isEqualTo "RscEdit"}) select 0);
        [[LSTRING(renamedObject), _ctrlText], 3] call EFUNC(common,displayTextStructured);
        GVAR(renameTarget) setVariable ["ace_cargo_customName", _ctrlText, true];
    };
}];

// add Background
private _ctrlBackground = _display ctrlCreate ["RscStructuredText", -1];
_ctrlBackground ctrlSetStructuredText parseText (["<t size=1 align='center'>", localize LSTRING(renameObjectUI), "</t>"] joinString "");
_ctrlBackground ctrlSetBackgroundColor [0,0,0,0.5];
_ctrlBackground ctrlSetPosition [
    safeZoneX + 0.4 * safeZoneW - 0.025,
    safeZoneY + 0.3 * safeZoneH - 0.025,
    safeZoneW * 0.2 + 0.05,
    safeZoneH * 0.04 + 0.05
];
_ctrlBackground ctrlCommit 0;

// add Edit Field
private _ctrlEdit = _display ctrlCreate ["RscEdit", -1];
_ctrlEdit ctrlSetText (_target getVariable ["ace_cargo_customName", ""]);
_ctrlEdit ctrlSetBackgroundColor [0,0,0,1];
_ctrlEdit ctrlSetPosition [
    safeZoneX + 0.4 * safeZoneW,
    safeZoneY + 0.3 * safeZoneH + 0.02,
    safeZoneW * 0.2,
    safeZoneH * 0.03
];
_ctrlEdit ctrlCommit 0;

// add Save Button
private _ctrlButton = _display ctrlCreate ["RscButton", 1]; // 1 = Ok btn
_ctrlButton ctrlSetText "Save Name";
_ctrlButton ctrlSetPosition [
    safeZoneX + 0.4 * safeZoneW - 0.025,
    safeZoneY + 0.3 * safeZoneH + (safeZoneH * 0.04 + 0.04),
    safeZoneW * 0.2 + 0.05,
    safeZoneH * 0.03
];
_ctrlButton ctrlCommit 0;
