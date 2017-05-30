/*
 * Author: SilentSpike
 * Initalises the `teleport players` zeus module display
 *
 * Arguments:
 * 0: teleportPlayers controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_control"];

//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
TRACE_1("logicObject",_logic);

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
private _listbox = _display displayCtrl 16189;
{
    if (alive _x) then {
        _listbox lbSetData [_listbox lbAdd (name _x), getPlayerUID _x];
    };
} forEach ([] call CBA_fnc_players);

_listbox lbSetCurSel 0;
(_display displayCtrl 16188) cbSetChecked (_logic getVariable ["tpGroup",false]);

private _fnc_onUnload = {
    params ["_display"];

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    // Store checkbox value for reopening
    _logic setVariable ["tpGroup", cbChecked (_display displayCtrl 16188)];
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};

    private _lb = _display displayCtrl 16189;

    private _uid = _lb lbData (lbCurSel _lb);
    private _group = cbChecked (_display displayCtrl 16188);

    [_logic, _uid, _group] call FUNC(moduleTeleportPlayers);
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
