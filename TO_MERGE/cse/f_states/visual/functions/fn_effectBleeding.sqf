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
if (isnil "cseDisplayingBleedingEffect") then {
	cseDisplayingBleedingEffect = false;
};
if (cseDisplayingBleedingEffect) exitwith {};
_handle = _this spawn {
	private ["_unit","_bloodLoss","_time"];
	_bloodLoss = _this select 0;
	if (!(_bloodLoss > 0)) exitwith{};
		_time = 6 - _bloodLoss;
	if (_time <1.5) then {
		_time = 1.5;
	};
	cseDisplayingBleedingEffect = true;
	47 cutRsc ["RscCSEScreenEffectsBleeding","PLAIN"];
	sleep _time;
	cseDisplayingBleedingEffect = false;
};

_handle