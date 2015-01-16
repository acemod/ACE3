#include "script_component.hpp"

private ["_unit", "_bodyPart", "_amountOfDamage"];
_unit = _this select 0;
_bodyPart = _this select 1;
_amountOfDamage = _this select 2;
if (alive _unit) then {
	_hitPointName = switch (_bodyPart) do {
		case 0: {"hitHead"};
		case 1: {"hitBody"};
		case 2: {"hitHands"};
		case 3: {"hitHands"};
		case 4: {"hitLegs"};
		case 5: {"hitLegs"};
		default {"hitLegs"};
	};

	if (_amountOfDamage < 0.95) then {
		_unit setHitPointDamage [_hitPointName, _amountOfDamage];
		_unit setHit [_selectionName, _amountOfDamage];
	} else {
		_unit setHitPointDamage [_hitPointName, 0.95];
		_unit setHit [_selectionName,  0.95];
	};
};