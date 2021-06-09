#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Custom wound handler for burns. Stores up small damage events until there's enough to create a wound.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Body Part <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Body", 0.5, "bullet"] call ace_medical_damage_fnc_woundsHandlerBurning
 *
 * Public: No
 */
params ["_unit", "_bodyPart", "_damage", "_typeOfDamage"];

// Ensure target selection is valid
if !((toLower _bodyPart) in ALL_BODY_PARTS) exitWith { ERROR_1("invalid body part %1",_bodyPart); };

private _varName = format [QGVAR(storedBurnDamage_%1), _bodyPart];
private _storedDamage = _unit getVariable [_varName, 0];
private _newDamage = _storedDamage + _damage;

if (_newDamage > 0.25) then {
	[_unit, _bodyPart, _newDamage, _typeOfDamage] call FUNC(woundsHandlerActive);
	_newDamage = 0;
};

_unit setVariable [_varName, _newDamage];