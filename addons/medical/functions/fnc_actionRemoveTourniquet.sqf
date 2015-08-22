/*
 * Author: Glowbal
 * Action for removing the tourniquet on specified selection
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_part", "_tourniquets", "_output"];
params ["_caller", "_target", "_selectionName"];

// grab the required data
_part = [_selectionName] call FUNC(selectionNameToNumber);
_tourniquets = _target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];

// Check if there is a tourniquet on this bodypart
if ((_tourniquets select _part) == 0) exitwith {
    _output = localize LSTRING(noTourniquetOnBodyPart);
    ["displayTextStructured", [_caller], [_output, 1.5, _caller]] call EFUNC(common,targetEvent);
};

// Removing the tourniquet
_tourniquets set[_part, 0];
_target setvariable [QGVAR(tourniquets), _tourniquets, true];

// Adding the tourniquet item to the caller
_caller addItem "ACE_tourniquet";
