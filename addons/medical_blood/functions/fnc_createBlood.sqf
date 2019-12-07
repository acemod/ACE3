#include "script_component.hpp"
/*
 * Author: Glowbal
 * Creates a blood object and handles its cleanup.
 * Available blood drop classes are blooddrop_1 through blooddrop_4.
 *
 * Arguments:
 * 0: Blood Drop Type <STRING>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * Blood Drop <OBJECT>
 *
 * Example:
 * ["blooddrop_2", getPos player] call ace_medical_blood_fnc_createBlood
 *
 * Public: No
 */

params ["_type", "_position"];
TRACE_2("Creating blood",_type,_position);

private _model = GVAR(models) getVariable _type;

private _bloodDrop = createSimpleObject [_model, [0, 0, 0]];
_bloodDrop setDir random 360;
_bloodDrop setPos _position;

[QGVAR(bloodDropCreated), _bloodDrop] call CBA_fnc_serverEvent;

_bloodDrop
