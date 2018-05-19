/*
 * Author: alganthe, mharis001
 * Initializes the "Toggle NVGs" Zeus module display.
 *
 * Arguments:
 * 0: toggleNvg controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_toggleNvg
 *
 * Public: No
 */
#include "script_component.hpp"

#define COMBO_ITEMS [[LSTRING(SelectedGroup), "\a3\ui_f_curator\data\displays\rscdisplaycurator\modegroups_ca.paa"], ["STR_WEST", "\a3\ui_f\data\map\diary\icons\playerwest_ca.paa"], ["STR_EAST", "\a3\ui_f\data\map\diary\icons\playereast_ca.paa"], ["STR_guerrila", "\a3\ui_f\data\map\diary\icons\playerguer_ca.paa"], ["STR_Civilian", "\a3\ui_f\data\map\diary\icons\playerciv_ca.paa"]]

params ["_control"];

// Generic init
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; // IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("Logic Object",_logic);

_control ctrlRemoveAllEventHandlers "SetFocus";

// Validate module target
private _unit = effectiveCommander (attachedTo _logic);

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
private _combo = _display displayCtrl 92856;

// Add target combo options (only add selected group option if placed on unit)
{
    _x params ["_text", "_icon"];
    _combo lbSetPicture [_combo lbAdd (localize _text), _icon];
} forEach (COMBO_ITEMS select [[0, 1] select (isNull _unit), 5]);

_combo lbSetCurSel 0;

// Set default NVG status
if !(isNull _unit) then {
    (_display displayCtrl 92855) lbSetCurSel ([0, 1] select !(hmd _unit isEqualTo ""));
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

    private _toggle = lbCurSel (_display displayCtrl 92855) > 0;
    private _combo = _display displayCtrl 92856;
    private _target = lbCurSel _combo;
    if (lbSize _combo > 4) then {DEC(_target)};

    [_logic, _toggle, _target] call FUNC(moduleToggleNvg);
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
