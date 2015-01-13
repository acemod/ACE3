#include "script_component.hpp"
//#define DEBUG_MODE_FULL
#define __cfg configFile >> "CfgAmmo" >> _ammo
private ["_unit","_t","_vel","_timeprev","_coef","_ammo","_c","_dt","_bullet"];
_bullet = _this select 0;
_unit = _this select 2;
_ammo = _this select 3;
_c = 1.42 * getNumber(__cfg >> "ace_windcoef");
_timeprev = time;

//_wind = ACE_wind;		//constant wind cheat
_bulletFunc = {
	_bullet = (_this select 0) select 0;
	if (alive _bullet) then {
		_coef = ((_this select 0) select 1)*accTime;
		_vel = velocity _bullet;
		_wind = ACE_wind;
		_vel set [0, (_vel select 0) + (_wind select 0)*_coef];
		_vel set [1, (_vel select 1) + (_wind select 1)*_coef];
		#ifdef DEBUG_MODE_FULL
			drop ["\Ca\Data\Cl_basic","","Billboard",1,30,getPos _bullet,[0,0,0],1,1.275,1.0,0.0,[0.125],[[1,0,0,0.5]],[0],0.0,2.0,"","",""];
		#endif
		_bullet setvelocity _vel;
		//TRACE_1("",_wind);
	} else {
		[_this select 1] call cba_fnc_removePerFrameHandler;
	};
};
_time = 0.075;

_h1 = [_bulletFunc, _time, [_bullet, _c*_time]] call cba_fnc_addPerFrameHandler;
