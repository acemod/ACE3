#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Initializes the "Defend Area" Zeus module display.
 *
 * Arguments:
 * 0: dummy controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_defendArea
 *
 * Public: No
 */

// Generic init
params ["_control"];
private _display = ctrlParent _control;
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);

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

switch (false) do {
    case !(isNull _unit): {
        [LSTRING(NothingSelected)] call _fnc_errorAndClose;
    };
    case (_unit isKindOf "CAManBase"): {
        [LSTRING(OnlyInfantry)] call _fnc_errorAndClose;
    };
    case (alive _unit): {
        [LSTRING(OnlyAlive)] call _fnc_errorAndClose;
    };
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

    private _unit = effectiveCommander (attachedTo _logic);
    private _radius = GETVAR(_display,GVAR(radius),100);
    private _position = getPos _logic;

    [QGVAR(moduleDefendArea), [_unit, _position, _radius], _unit] call CBA_fnc_targetEvent;
    deleteVehicle _logic;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_control ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
