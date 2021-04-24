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
params ["_control",["_g_sc",curatorSelected select 0]];
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
    case !(isNull _unit and (_g_sc == [])): {
        [LSTRING(NothingSelected)] call _fnc_errorAndClose;
    };
	case (isNull _unit): {
		_g_sc = [_unit];
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
    params [["_ctrlButtonOK", controlNull, [controlNull]],["_g_sc"
		,curatorSelected select 0		//[1]
	]];

    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};

	// scrap [1]
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    if (isNull _logic and (_g_sc == [])) exitWith {};
    private _unit = effectiveCommander (attachedTo _logic);
	if (!isNull _unit) then{ _g_sc = [_unit]; };

    private _radius = GETVAR(_display,GVAR(radius),100);
    private _position = getPos _logic;

    {
    	_unit = effectiveCommander _x;
		[QGVAR(moduleDefendArea), [_unit, _position, _radius], _unit] call CBA_fnc_targetEvent;
	}forEach _g_sc;
    deleteVehicle _logic;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_control ctrlAddEventHandler ["ButtonClick", _this + [_g_sc] call _fnc_onConfirm];
