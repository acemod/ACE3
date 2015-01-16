/**
 * fn_reactionToHit_CMS.sqf
 * @Descr: triggers a reaction to being hit for a unit and spawns on screen effects.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_amountOfDamage"];
_unit			= _this select 0;
_amountOfDamage = _this select 1;

if (_amountOfDamage > 0.2) then {
	// [_unit] call FUNC(playInjuredSound_CMS);
	if ((vehicle _unit) isKindOf "StaticWeapon") exitwith {
		if (_amountOfDamage > 1) then {
			_unit action ["eject", vehicle _unit];
			unassignVehicle _unit;
		};
	};
	if (animationState _unit in ["ladderriflestatic","laddercivilstatic"]) exitwith {
		_unit action ["ladderOff", (nearestBuilding _unit)];
	};

	if (vehicle _unit == _unit && [_unit] call EFUNC(common,isAwake)) then {
		if (random(1) > 0.5) then {
			_unit setDir ((getDir _unit) + 1 + random(30));
		} else {
			_unit setDir ((getDir _unit) - (1 + random(30)));
		};
	};
	if (_amountOfDamage > 0.6) then {
		if (random(1)>0.6) then {
			[_unit] call EFUNC(common,setProne);
		};
	};
	if (isPlayer _unit) then {
		76 cutRsc [QEGVAR(common,ScreenEffectsHit),"PLAIN"];
		addCamShake [3, 5, _amountOfDamage + random 10];
	};
} else {
	if (_amountOfDamage > 0) then {
		if (isPlayer _unit) then {
			76 cutRsc [QEGVAR(common,ScreenEffectsHit),"PLAIN"];
		};
	};
};