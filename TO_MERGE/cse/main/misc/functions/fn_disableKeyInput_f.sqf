/**
 * fn_disableKeyInput_f.sqf
 * @Descr: Disable the keyinput
 * @Author: Glowbal
 *
 * @Arguments: [disable BOOL]
 * @Return: void
 * @PublicAPI: false
 */



private["_disable"];
_disable = [_this, 0, false, [false]] call BIS_fnc_Param;
if (!hasInterface) exitwith {};
CSE_DISABLE_KEY_INPUT_F = _disable;

[format["Disable Key input: %1",_disable]] call cse_fnc_debug;
if (_disable) then {
	if (isNil "CSE_DISABLE_KEY_UP_INPUT_DISPLAY_EH_F") then {
		[format["Keyinput has not yet been disabled, now disabling",_disable]] call cse_fnc_debug;

		CSE_DISABLE_USER_INPUT_SCREEN = true;
		createDialog 'cse_empty_screen';
		disableSerialization;
		_display = uiNamespace getvariable "cse_empty_screen";
		CSE_DISABLE_KEY_UP_INPUT_DISPLAY_EH_F = _display displayAddEventHandler ["KeyDown", {
			_return = true;
			if ((_this select 1) == 1) then {
				if (isNull finddisplay 49) then {
					[format["Assigning ctrlEventhandlers to buttons"]] call cse_fnc_debug;
					if (isMultiplayer) then {
						createDialog "RscDisplayMPInterrupt";
						_ctrl = (finddisplay 49) displayctrl 103;
						_ctrl ctrlSetEventHandler ["buttonClick", "closeDialog 0; [false] call cse_fnc_disableKeyInput_f; failMission 'LOSER';"];

						_ctrl = (finddisplay 49) displayctrl 104;
						_ctrl ctrlSetEventHandler ["buttonClick", "closeDialog 0; [false] call cse_fnc_disableKeyInput_f; player setDamage 1;"];
					} else {
						createDialog "RscDisplayInterrupt";
						_ctrl = (finddisplay 49) displayctrl 104;
						_ctrl ctrlSetEventHandler ["buttonClick", "closeDialog 0; [false] call cse_fnc_disableKeyInput_f; failMission 'LOSER';"];
					};
				} else {
					closeDialog 49;
				};
			};

			if ((_this select 1) in actionKeys "CuratorInterface" && {player in allCurators}) then {
				openCuratorInterface
			};
			if (serverCommandAvailable "#missions") then {
			};
			[format["Returning %1 for disable key input keyDown handler", _return]] call cse_fnc_debug;
			_return;
		}];
		CSE_DISABLE_KEY_DOWN_INPUT_DISPLAY_EH_F = _display displayAddEventHandler ["KeyUp", {true;}];
	};
} else {
	if (!isNil "CSE_DISABLE_KEY_UP_INPUT_DISPLAY_EH_F") then {
		[format["Keyinput has been disabled, now enabling",_disable]] call cse_fnc_debug;
		CSE_DISABLE_USER_INPUT_SCREEN = false;
		disableSerialization;
		_display = uiNamespace getvariable "cse_empty_screen";
		if (isnil "_display") then {
			_display = displayNull;
		};
		closeDialog 679123;
		_display closeDisplay 1;
		_display displayRemoveEventHandler ["KeyDown", CSE_DISABLE_KEY_UP_INPUT_DISPLAY_EH_F];
		_display displayRemoveEventHandler ["KeyUp", CSE_DISABLE_KEY_DOWN_INPUT_DISPLAY_EH_F];
		CSE_DISABLE_KEY_DOWN_INPUT_DISPLAY_EH_F = nil;
		CSE_DISABLE_KEY_UP_INPUT_DISPLAY_EH_F = nil;
	};
};

[[_disable], "disableKeyInput"] call cse_fnc_customEventHandler_F;