#include "script_component.hpp"
/*
 * Author: alganthe, mharis001
 * Initializes the "Toggle Flashlights" Zeus module display.
 *
 * Arguments:
 * 0: toggleFlashlight controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_toggleFlashlight
 *
 * Public: No
 */

params ["_control"];

// Generic init
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; // IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("Logic Object",_logic);

_control ctrlRemoveAllEventHandlers "SetFocus";

// Validate module target
private _unit = effectiveCommander attachedTo _logic;

scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    _display closeDisplay 0;
    deleteVehicle _logic;
    [_msg] call FUNC(showMessage);
    breakOut "Main";
};

if !(isNull _unit) then {
    switch (false) do {
        case (_unit isKindOf "CAManBase"): {
            [LSTRING(OnlyInfantry)] call _fnc_errorAndClose;
        };
        case (alive _unit): {
            [LSTRING(OnlyAlive)] call _fnc_errorAndClose;
        };
    };
};

// Specific onLoad stuff
// Remove selected group option in not placed on unit and set default flashlight status
if (isNull _unit) then {
    (_display displayCtrl 56220) lbDelete 0;
} else {
    (_display displayCtrl 56218) lbSetCurSel ([0, 1] select (_unit isFlashlightOn currentWeapon _unit));
};

private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic) exitWith {};

    private _toggle = lbCurSel (_display displayCtrl 56218) > 0;
    private _addGear = lbCurSel (_display displayCtrl 56219) > 0;
    private _combo = _display displayCtrl 56220;
    private _target = lbCurSel _combo;
    if (lbSize _combo > 4) then {DEC(_target)};

    [_logic, _toggle, _addGear, _target] call FUNC(moduleToggleFlashlight);
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
