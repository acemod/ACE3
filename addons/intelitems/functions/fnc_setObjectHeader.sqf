#include "..\script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Sets the intel header for an object. Used by 3DEN and Zeus attributes.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Header <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "New Header"] call ace_intelitems_fnc_setObjectHeader
 *
 * Public: No
 */

params ["_object", "_header"];
TRACE_1("setObjectHeader",_this);
private _data = "";
private _index = _object getVariable [QGVAR(index), -1];
if (_index == -1) then {
    _index = GVAR(intelCount);
    GVAR(intelCount) = GVAR(intelCount) + 1;
    _object setVariable [QGVAR(index), _index, true];
} else {
    _data = GET_DATA(_index) select 0;
};
SET_DATA(_index,_data,_header);
