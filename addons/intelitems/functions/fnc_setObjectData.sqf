#include "..\script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Sets the intel data for an object. Used by 3DEN and Zeus attributes.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Data <STRING>
 * 2: Header <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "123"] call ace_intelitems_fnc_setObjectData
 *
 * Public: No
 */

params ["_object", "_data", "_header"];
TRACE_1("setObjectData",_this);

private _index = _object getVariable [QGVAR(index), -1];

if (_index == -1) then {
    _index = GVAR(intelCount);
    GVAR(intelCount) = GVAR(intelCount) + 1;

    _object setVariable [QGVAR(index), _index, true];

    if (isNil "_header") then {
        _header = getText (configOf _object >> "displayName");
    };
} else {
    if (isNil "_header") then {
        _header = GET_DATA(_index) select 1;
    };
};

SET_DATA(_index,_data,_header);
