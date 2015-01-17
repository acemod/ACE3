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

private ["_unit","_carriedObj"];
_unit = _this select 0;
_fallDown = false;
if (count _this > 1) then {
	_fallDown = _this select 1;
};

if ((_vehicle getvariable [QGVAR(limitMovementSpeed),false])) exitwith {
	_vehicle setvariable [QGVAR(limitMovementSpeed),nil,true];
};

{
	private["_unit","_fallDown","_carriedObj"];
	_unit = (_this select 0) select 0;
	_fallDown = (_this select 0) select 1;

	_carriedObj = [_unit] call FUNC(getCarriedObj)

	if !(_vehicle getvariable [QGVAR(limitMovementSpeed),false]) exitwith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	};
	if !((!isNull _carriedObj) && (alive _unit)) exitwith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	};

	if (speed _unit > 12 && vehicle _unit == _unit && isTouchingGround) then {

		_unit setVelocity [0,0,0];

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
}, 0.5, [_unit,_fallDown] ] call CBA_fnc_addPerFrameHandler;
