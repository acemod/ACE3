/**
 * fn_callForSurrender_AIM.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define DISTANCE_AWAY 50

// TODO add missing variables to private array
private ["_nearest"];
_nearest = (player nearEntities [["CAManBase"], DISTANCE_AWAY]);

_amountOpfor = {side _x == EAST} count _nearest;
_amountBlufor = {side _x == west} count _nearest;
_amountInd = {side _x == independent} count _nearest;

_amountOfSideCaller = switch (playerSide) do {
	case west: {_amountOpfor};
	case east: {_amountBlufor};
	case independent: {_amountInd};
	default {0};
};
if (_amountOfSideCaller == 0) exitwith {};

{
	if (side _x != playerSide && !(isPlayer _x)) then {
		if (!(lineIntersects [eyePos player, eyePos _x, _x, player]) || (random(1)>=0.75)) then {

			_amountOfSideTarget = switch (side _x) do {
				case west: {_amountOpfor};
				case east: {_amountBlufor};
				case independent: {_amountInd};
				default {0};
			};
			_magCount = count magazines _x;
			_allWeapons = weapons _x;
			_availableMags = 0;
			{
				if (isArray (configFile >> "CfgWeapons" >> _x  >> "magazines")) then {
					_magazineArray = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
					_canFitInWeapon = {_x in _magazineArray} count _magCount;
					_availableMags = _availableMags + _canFitInWeapon;
				};
			}foreach _allWeapons;

			if (_amountOfSideTarget / _amountOfSideCaller <= (0.1) + random(0.1)) then {
				if (_availableMags <= 1) then {
					// unit is out as well, so surrender here.
					[format["UNIT %1 is surrendering", _x]] call cse_fnc_debug;

					// TODO implement surrender functionality
				};
			};

		};
	};
}count _nearest;