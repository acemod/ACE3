/**
 * fn_effectBleeding.sqf
 * @Descr: Displays the CSE Bleeding effect
 * @Author: Glowbal
 *
 * @Arguments: [bloodLoss NUMBER]
 * @Return: void
 * @PublicAPI: true
 */

private ["_handle"];
if (isnil QGVAR(DisplayingBleedingEffect)) then {
	GVAR(DisplayingBleedingEffect) = false;
};
if (GVAR(DisplayingBleedingEffect)) exitwith {};
_handle = _this spawn {
	private ["_unit","_bloodLoss","_time"];
	_bloodLoss = _this select 0;
	if (!(_bloodLoss > 0)) exitwith{};
		_time = 6 - _bloodLoss;
	if (_time <1.5) then {
		_time = 1.5;
	};
	GVAR(DisplayingBleedingEffect) = true;
	47 cutRsc [QGVAR(ScreenEffectsBleeding),"PLAIN"];
	sleep _time;
	GVAR(DisplayingBleedingEffect) = false;
};

_handle