#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: details entry <STRING>
 *
 * Return Value:
 * ID <STRING>
 *
 * Public: No
 */


params ["_detailsEntry"];

private _index = _detailsEntry find "[";
private _id = "";

if (_index > 0) then {
    private _value = toArray _detailsEntry;
    _value deleteRange [0, _index];
    _id = toString _value;
};

_id
