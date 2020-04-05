#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * Something
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_onDrawMap
 *
 * Public: No
 */

params ["_display"];

(_display displayCtrl 1016) ctrlShow GVAR(mapShowCursorCoordinates);

// hide clock when no watch in inventory, or whatever never ever
(_display displayCtrl 101) ctrlShow GVAR(hasWatch);


private _hasAceTopo = ((assignedItems ace_player) param [0, ""]) == "ace_TopographicMap";
private _ctrlTopoMap = _display displayCtrl 9051;
private _ctrlMap = _display displayCtrl 51;

if (!((ctrlShown _ctrlTopoMap) isEqualTo _hasAceTopo)) then {
    TRACE_1("updating ctrls",_hasAceTopo);
    _ctrlMap ctrlShow false;
    _ctrlMap ctrlCommit 0;
    _ctrlTopoMap ctrlShow false;
    _ctrlTopoMap ctrlCommit 0;

    _ctrlTopoMap ctrlSetPosition ctrlPosition _ctrlMap;

    _ctrlMap ctrlShow true;
    _ctrlMap ctrlCommit 0;
    _ctrlTopoMap ctrlShow _hasAceTopo;
    _ctrlTopoMap ctrlCommit 0;
};
if (_hasAceTopo) then {
    if (ctrlMapAnimDone _ctrlMap) then {
        // update old map to the new maps position and scale
        private _ctrlPos = ctrlPosition _ctrlMap;
        private _centerScreen = [_ctrlPos#0 + _ctrlPos#2 / 2, _ctrlPos#1 + _ctrlPos#3 / 2];
        private _centerPos = _ctrlTopoMap ctrlMapScreenToWorld _centerScreen;
        private _scale = ctrlMapScale _ctrlTopoMap;
        _ctrlMap ctrlMapAnimAdd [0.01, _scale, _centerPos];
        ctrlMapAnimCommit _ctrlMap;
    };
};
