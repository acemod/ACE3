//fuze_prox.sqf
#include "\x\ace\addons\sys_arty_ammunition\script_component.hpp"
private["_shell"];

_shell = _this select 6;
[
	{
		_vel = velocity _shell;
		if ((_vel select 2) < 0) then {
			if (getPosATL _shell select 2 <= 5) then {
				_fuzed = true;
				_vel = velocity _shell;
				_pos = getPos _shell;
				_explosionClass = getText(configFile >> "CfgAmmo" >> typeOf _shell >> "ACE_ARTY_EXPLOSION");
				_exp = _explosionClass createVehicle _pos;
				_exp setVectorDir _vel;
				deleteVehicle _shell;
			};
		};
	},
	[_shell],
	0.00, // delay
	{
		//init
		_shell = _this select 0;
		_shellType = typeOf _shell;
		_lastPos = [];
		_lastVel = [];
		_fuzed = false;
	},
	{
		if (!_fuzed) then {
			_vel = velocity _shell;
			_pos = getPos _shell;
			_explosionClass = getText(configFile >> "CfgAmmo" >> typeOf _shell >> "ACE_ARTY_EXPLOSION");
			_exp = _explosionClass createVehicle _pos;
			_exp setVectorDir _vel;
		};
	},
	{
		true
	},
	{!alive _shell},
	[ 
		"_shell", "_lastPos", "_lastVel", "_fuzed", "_shellType"
	]
] call cba_common_fnc_addPerFrameHandlerLogic;