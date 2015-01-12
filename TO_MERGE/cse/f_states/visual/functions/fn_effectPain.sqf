/**
 * fn_effectPain.sqf
 * @Descr: Displays the CSE Pain effect
 * @Author: Glowbal
 *
 * @Arguments: [painRatio NUMBER]
 * @Return: void
 * @PublicAPI: true
 */

if (isnil "cseDisplayingPainEffect") then {
	cseDisplayingPainEffect = false;
};
if (cseDisplayingPainEffect) exitwith {};
_this spawn {
	private ["_ratio","_time"];
	_ratio = _this select 0;
	if (!(_ratio > 0)) exitwith{};
		_time = 6 - _ratio;
	if (_time <1.5) then {
		_time = 1.5;
	};
	cseDisplayingPainEffect = true;
	46 cutRsc ["RscCSEScreenEffectsPain","PLAIN"];
	sleep _time;
	cseDisplayingPainEffect = false;
};