#include "script_component.hpp"

PARAMS_1(_cargo);

if (GVAR(disabled)) exitWith {
	_cargo spawn {
		private "_magHolder";
		sleep 2;
		_magHolder = "WeaponHolder" createVehicle [0,0,0];
		_magholder addMagazineCargoGlobal ["ACE_Rope_M5", 1];
		[QGVAR(wh), _magHolder] call CBA_fnc_globalEvent;
		_magHolder setPos [((position _this) select 0) + 2, ((position _this) select 1) + 2, 0];
	};
};

player playmove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
player removeMagazine "ACE_Rope_M5";
_cargo setVariable [QGVAR(hasSlingRope), true, true];

// TODO: Process

// TODO: Visual attached sling rope to cargo, to indicate something is prepared.
