#include "script_component.hpp"
#define __dsp (uiNamespace getVariable "ACE_RscWindIntuitive")
#define __ctrl (__dsp displayCtrl 1591514)

private["_class","_wpn","_s"];
PARAMS_1(_keyData);

//a 'valve' to cut off multiple key press events within 1 frame
if (GVAR(presstime) == time) exitwith {false};
GVAR(presstime) = time;
if (GVAR(running)) exitwith { GVAR(running) = false; false }; //switch info off
GVAR(running) = true;

if ((player getVariable ["ace_sys_eject_skydiving",false]) || {((vehicle player) iskindof "BIS_Steerable_Parachute" || {(vehicle player) iskindof "ParachuteBase"})}) then {
	[] spawn ace_sys_eject_fnc_showAltimeter;
} else {
	if (player != vehicle player && {!(vehicle player iskindof "StaticWeapon")}) exitwith { GVAR(running) = false; false }; // Allow checking wind in Static Laserdesignator and Spottingscope
	0 spawn {
		private ["_unit","_str","_clock","_cookie"];
		_unit = player;
		13523 cutRsc ["ACE_RscWindIntuitive", "PLAIN"];
		__ctrl ctrlsetscale 0.75;
		__ctrl ctrlcommit 0;
		while { GVAR(running) && {player == _unit} && {!(isNull __dsp)} } do {
			_str = ACE_wind call ACE_fnc_magnitude;
			_clock = call FUNC(clockwind);
			_cookie = [_clock,_str] call FUNC(wind_intuitive);
			//hint format["dir %1 str %2",_clock,_str];
			sleep 0.5;
		};
		GVAR(running) = false;
		if (!isNull __dsp) then { 13523 cutRsc ["Default", "PLAIN",3] };
	};
};
true;
