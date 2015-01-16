/**
 * fn_assignOpenWounds_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_amountOfDamage", "_typeOfInjury", "_bodyPartn","_sizeOfWound","_amountOfNewWounds", "_return"];
_unit = _this select 0;
_amountOfDamage = _this select 1;
_typeOfInjury = _this select 2;
_bodyPartn = _this select 3;
_sizeOfWound = 0;
_amountOfNewWounds = 0;

_return = false;
if (_amountOfDamage > 0.05) then {
	switch (_typeOfInjury) do {
		case "Bullet": {
			_amountOfNewWounds = 1;
			_sizeOfWound = round(random(2));
		};
		case "Grenade": {
			_amountOfNewWounds = 1;
			_sizeOfWound = round(random(2));
			if (_sizeOfWound < 1) then {
				_sizeOfWound = 1;
			};
		};
		case "Explosive": {
			_amountOfNewWounds = 1;
			_sizeOfWound = round(random(2));
			if (_sizeOfWound < 1) then {
				_sizeOfWound = 1;
			};
		};
		case "Shell": {
			_amountOfNewWounds = 1;
			_sizeOfWound = round(random(2));
			if (_sizeOfWound < 1) then {
				_sizeOfWound = 1;
			};
		};
		case "Unknown": {
			_amountOfNewWounds = 1;
			_sizeOfWound = round(random(1));
		};
		case "VehicleCrash": {
			_amountOfNewWounds = if (random(1)>=0.5) then{0}else{1};
			_sizeOfWound = round(random(1));
		};
		default {
			_amountOfNewWounds = 1;
			_sizeOfWound = round(random(1));
		};
	};
	if (_sizeOfWound > 2) then {
		_sizeOfWound = 3;
	};
	if (_amountOfNewWounds>0) then {
		[_unit, _bodyPartn, _sizeOfWound, _amountOfNewWounds] call FUNC(addOpenWounds_CMS);
		_return = true;
	};
};

_return;