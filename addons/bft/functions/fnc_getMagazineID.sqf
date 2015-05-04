/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_detailsEntry", "_index", "_value", "_id"];
_detailsEntry = _this select 0;

_index = _detailsEntry find "[";

_id = "";
if (_index > 0) then {
    _value = toArray _detailsEntry;
    _value deleteRange [0, _index];
    _id = toString _value;
};

_id;
