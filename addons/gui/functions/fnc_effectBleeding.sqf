/**
 * fn_effectBleeding.sqf
 * @Descr: Displays the ACE Bleeding effect
 * @Author: Glowbal
 *
 * @Arguments: [bloodLoss NUMBER]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

if (isnil QGVAR(DisplayingBleedingEffect)) then {
	GVAR(DisplayingBleedingEffect) = false;
};
if (GVAR(DisplayingBleedingEffect)) exitwith {};
private ["_bloodLoss","_time"];
_bloodLoss = _this select 0;
if (!(_bloodLoss > 0)) exitwith{};

_time = 10 - _bloodLoss;
if (_time < 1.5) then {
	_time = 1.5;
};
GVAR(DisplayingBleedingEffect) = true;
47 cutRsc [QGVAR(ScreenEffectsBleeding),"PLAIN"];

[{
	if !(isnil QGVAR(DisplayingBleedingEffect_ran)) then {
		GVAR(DisplayingBleedingEffect_ran) = nil;
		GVAR(DisplayingBleedingEffect) = false;
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	} else {
		GVAR(DisplayingBleedingEffect_ran) = true;
	};
}, _time, [] ] call CBA_fnc_addPerFrameHandler;
