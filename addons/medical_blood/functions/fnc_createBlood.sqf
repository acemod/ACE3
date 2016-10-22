/*
 * Author: Glowbal
 * Spawn a blood drop.
 * Available blood drop classes are blooddrop_1 through blooddrop_4.
 *
 * Arguments:
 * 0: classname of blood drop <OBJECT>
 * 1: Position <ARRAY>
 *
 * Return Value:
 * Created blood drop <OBJECT>
 *
 * Example:
 * ["blooddrop_2", getPos player] call ace_medical_blood_fnc_createBlood
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_type", "_pos"];
TRACE_2("creating blood",_type,_pos);

private _model = GVAR(models) getVariable _type;

private _object = createSimpleObject [_model, [0,0,0]];
_object setDir random 360;
_object setPos _pos;

[QGVAR(bloodDropCreated), [_object]] call CBA_fnc_serverEvent;

_object
