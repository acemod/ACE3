/*
 * Author: Glowbal
 * Apply a tourniquet to the patient, local callback.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Item used classname <STRING>
 * 2: Body part <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_tourniquetItem", "_bodyPart"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

// Place a tourniquet on the bodypart
private _tourniquets = GET_TOURNIQUETS(_target);

_tourniquets set [_partIndex, CBA_missionTime];

_target setVariable [VAR_TOURNIQUET, _tourniquets, true];
