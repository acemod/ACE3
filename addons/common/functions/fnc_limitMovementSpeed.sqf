/**
 * fn_limitMovementSpeed.sqf
 * @Descr: Limits the movement speed of a unit
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, fallDown BOOL (Optional)]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

_this spawn {
	private ["_unit","_carriedObj"];
	_unit = _this select 0;
	_fallDown = false;
	if (count _this > 1) then {
		_fallDown = _this select 1;
	};
	_carriedObj = [_unit] call FUNC(getCarriedObj);
	while {sleep 1;_carriedObj = [_unit] call FUNC(getCarriedObj); ((!isNull _carriedObj) && (alive _unit))} do {
		if (speed _unit > 12 && vehicle _unit == _unit) then {
			[format["Unit ran to fast (Speed: %1, is now dropping carrying obj",speed _unit],2] call FUNC(debug);
			if (_fallDown) then {
				_unit playMove "amovppnemstpsraswrfldnon";
			};

			if (_carriedObj isKindOf "Man") then {
				hint "You can not move this fast while transporting this person.";
			} else {
				hint "You can not move this fast while carrying this object";
			};
			[_unit,ObjNull] call FUNC(carryObj);
		};
	};
};
