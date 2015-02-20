/*
 * Author: Garth 'L-H' de Wet
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * object addEventHandler ["EpeContactStart", ACE_explosive_fnc_onLanded];
 *
 * Public: No
 */
#include "script_component.hpp"
if (!((_this select 0) getVariable [QGVAR(Handled), false])) then {
	(_this select 0) setVariable [QGVAR(Handled), true];
	if (!isNull (_this select 1) && {(_this select 1) isKindOf "AllVehicles"}) then {
		_player RemoveMagazine _mag;
		_explosive attachTo [(_this select 1)];
		_dir = _dir - (getDir (_this select 1));
		[[_explosive, _dir, 0], QFUNC(setPosition)] call EFUNC(common,execRemoteFnc);
	} else {
		[{
			EXPLODE_2_PVT(_this,_player,_explosive);
			private ["_pos"];
			_player setVariable [QGVAR(PlantingExplosive), false];
			_pos = getPosATL _explosive;
			//_explosive enableSimulationGlobal false;
			if (surfaceIsWater _pos) then {
				_pos = getPosASL _explosive;
				_explosive setPosASL _pos;
			}else{
				_explosive setPosATL _pos;
			};
			_player RemoveMagazine _mag;
		}, [ACE_player, _this select 0], 0.5, 0.1] call EFUNC(common,waitAndExecute);
	};
};
