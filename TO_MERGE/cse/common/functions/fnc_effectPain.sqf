/**
 * fn_effectPain.sqf
 * @Descr: Displays the CSE Pain effect
 * @Author: Glowbal
 *
 * @Arguments: [painRatio NUMBER]
 * @Return: void
 * @PublicAPI: true
 */

if (isnil QGVAR(DisplayingPainEffect)) then {
	GVAR(DisplayingPainEffect) = false;
};

if (GVAR(DisplayingPainEffect)) exitwith {};
_this spawn {
	private ["_ratio","_time"];
	_ratio = _this select 0;
	if (!(_ratio > 0)) exitwith{};
		_time = 6 - _ratio;
	if (_time <1.5) then {
		_time = 1.5;
	};
	GVAR(DisplayingPainEffect) = true;
	46 cutRsc [QGVAR(ScreenEffectsPain),"PLAIN"];
	sleep _time;
	GVAR(DisplayingPainEffect) = false;
};