/**
 * fn_checkIEDActivated_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic","_triggered"];
_logic = _this select 0;
_triggered = false;

switch (true) do {
	case (_logic getvariable ["iedActivationType",0] == 0): {
		if ([_logic] call cse_fnc_checkPressurePlateActivated_IEDS) then {
			_triggered = true;
		};
	};
	case (_logic getvariable ["iedActivationType",0] == 1): {
		if ([_logic] call cse_fnc_checkRadioTriggered_IEDS) then {
			_triggered = true;
		};
	};
	case (_logic getvariable ["iedActivationType",0] == 2): {
		if ([_logic] call cse_fnc_checkPressurePlateActivated_IEDS) then {
			_triggered = true;
		};
	};
	default {
	};
};

if (_triggered) then {
	[_logic] call cse_fnc_onIEDActivated_IEDS;
};

_triggered