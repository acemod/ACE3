/*
 * Author: Glowbal
 * Check if unit has a tourniquet applied to the specified bodypart
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Body Part <STRING>
 *
 * ReturnValue:
 * Has tourniquet applied <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_target", "_bodyPart"];

private _index = ALL_BODY_PARTS find toLower _bodyPart;

if (_index < 0) exitWith { false };

((_target getVariable [QGVAR(tourniquets), [0,0,0,0,0,0]]) select _index) > 0
