//dumps distance-side drift data for each frame into the rpt

#include "script_component.hpp"
//PARAMS_3(_u,_w,_magazine);
#define __cfg configFile >> "CfgAmmo" >> _ammo

if (isNil QUOTE(FUNC(supah_funwind))) then {
	FUNC(supah_funwind) = {
		private ["_defl","_pos0","_pos","_dist","_cos","_dir0","_dir","_d","_b"];
		PARAMS_3(_pos,_pos0,_dir0); //cur bullet pos, init bullet position, init bullet direction

		_d = _pos distance _pos0;
		_dir = [(_pos select 0)-(_pos0 select 0),(_pos select 1)-(_pos0 select 1)];
		_cos = (_dir select 0)*(_dir0 select 0) + (_dir select 1)*(_dir0 select 1);
		_b = sqrt(     ((_dir select 0)^2 + (_dir select 1)^2)*((_dir0 select 0)^2 + (_dir0 select 1)^2)  );
		_cos = if (_b == 0) then {0} else {_cos/_b};
		_defl = _d*sqrt(1 - _cos^2);
		TRACE_2("",_d*_cos,_defl);
	};
};

private ["_unit","_weapon","_ammo","_bullet","_veh","_vel"];

_bullet = _this select 5;
if (isNull _bullet) exitwith {};

_unit = _this select 0;
_weapon = _this select 1;
_ammo = _this select 4;
_veh = vehicle player;

if (_bullet isKindOf "bulletBase") then {
	[_bullet, velocity _bullet, getpos _bullet] spawn {
		private ["_pos0"];
		PARAMS_2(_bullet,_vel0);
		_pos0 = [(_this select 2) select 0,(_this select 2) select 1];

		while {alive _bullet} do {
			[[(getpos _bullet) select 0,(getpos _bullet) select 1],_pos0,_vel0] call FUNC(supah_funwind);
			sleep 0.001;
		};
	};
};
