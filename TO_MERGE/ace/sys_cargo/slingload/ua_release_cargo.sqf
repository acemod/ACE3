#include "script_component.hpp"

_helicopter = _this select 3;

_cargo = _helicopter getvariable QGVAR(cargo);
_altobj = _helicopter getvariable QGVAR(cargoHeight);

_helicopter setvariable [QGVAR(isTransporting), false, true];
_helicopter setvariable [QGVAR(cargoHeight), 0];
_helicopter setvariable [QGVAR(cargo), objnull];

// TODO: playsound >clonk<

// Sling rope is still attached to the cargo

detach (_helicopter getVariable QGVAR(slingrope));
detach _cargo;
deleteVehicle (_helicopter getVariable QGVAR(slingrope)); // Delete physical rope object

_helicopter setVariable [QGVAR(slingrope), objnull];

_helicopter removeAction (_helicopter getvariable QGVAR(cutAction));
_helicopter setVariable [QGVAR(cutAction), -1];

if ((getpos _cargo) select 2 < 2) then {
	_altfinal = ((getposASL _cargo) select 2) - ((getpos _cargo) select 2);
	_cargo setposASL [getpos _cargo select 0, getpos _cargo select 1, _altfinal];
} else {
	_vel = velocity _helicopter;
	_retro = _vel select 2;
	_altant = (getpos _cargo) select 2;
	_cargo setvelocity [_vel select 0, _vel select 1, -1];
	_helicopter setvelocity [_vel select 0, _vel select 1, _retro];

	_dam = 0.00;
	_delay = 0.01;

	sleep 0.25;

	_static = (_cargo isKindOf "Static");
	if (!_static) then {
		if ((getpos _cargo select 2) == _altant) then {
			_static = true;
		};
	};

	_pos = getPos _cargo;

	// TODO: Possible cause for statics staying in the air?
	while {(position _cargo select 2) > 0} do {
		if (_dam < 1) then {_dam = _dam + _delay};
		if (_static) then {_cargo setpos [_pos select 0, _pos select 1, (getpos _cargo select 2) - 0.25]};
		sleep _delay;
	};
	if (_static) then {_cargo setpos [_pos select 0, _pos select 1, 0]};
	_cargo setdamage (damage _cargo + _dam);
};

_cargo setVariable [QGVAR(isLoaded),false,true];

// Create slingrope next to cargo object
_cargo spawn {
	private ["_magHolder"];
	sleep 2;
	_magHolder = "WeaponHolder" createVehicle [0,0,0];
	_magholder addMagazineCargoGlobal ["ACE_Rope_M5", 1];
	[QGVAR(wh), _magHolder] call CBA_fnc_globalEvent;
	_magHolder setPos [((position _this) select 0)+2, ((position _this) select 1)+2,0];
};
_cargo setVariable [QGVAR(hasSlingRope), false, true];

// Unlock
if (_cargo call CBA_fnc_locked) then {
	_lockedBefore = _cargo getVariable [QGVAR(locked), false];
	if !(_lockedBefore) then {
		[QGVAR(lock), [_cargo, false]] call CBA_fnc_globalEvent;
	};
};
