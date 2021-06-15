#include "script_component.hpp"
/*
 * Author: Pterolatypus
 * Custom wound handler for burns. Stores up small damage events until there's enough to create a wound.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "Body"]] "bullet"] call ace_medical_damage_fnc_woundsHandlerBurning
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];

{
	_x params ["_damage", "_bodyPart"];
	// Ensure target selection is valid
	if !((toLower _bodyPart) in ALL_BODY_PARTS) then {
		ERROR_1("invalid body part %1",_bodyPart);
		continue
	};

	private _varName = format [QGVAR(storedBurnDamage_%1), _bodyPart];
	private _storedDamage = _unit getVariable [_varName, 0];
	private _newDamage = _storedDamage + _damage;

	// schedule a task to convert stored damage to wounds after 1s
	// because the task resets stored damage to zero, if it isn't currently zero that means there is a task already waiting
	if (_storedDamage == 0 && _newDamage > 0) then {
		[{
			params ["_unit", "_bodyPart", "_typeOfDamage"];

			private _varName = format [QGVAR(storedBurnDamage_%1), _bodyPart];
			private _storedDamage = _unit getVariable [_varName, 0];
			[_unit, [[_storedDamage, _bodyPart]], _typeOfDamage] call FUNC(defaultWoundHandler);
			_unit setVariable [_varName, 0, true];
		},
		[_unit, _bodyPart, _typeOfDamage], 1] call CBA_fnc_waitAndExecute;
	};

	_unit setVariable [_varName, _newDamage];
} forEach _allDamages;