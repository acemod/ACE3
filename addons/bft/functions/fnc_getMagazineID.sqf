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

#include "script_component.hpp"

PARAMS_1(_detailsEntry);

private ["_index", "_value", "_id"];
_index = _detailsEntry find "[";
_id = "";

if (_index > 0) then {
    _value = toArray _detailsEntry;
    _value deleteRange [0, _index];
    _id = toString _value;
};

_id
