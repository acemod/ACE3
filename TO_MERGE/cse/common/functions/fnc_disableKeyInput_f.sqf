/**
 * fn_disableKeyInput_f.sqf
 * @Descr: Disable the keyinput
 * @Author: Glowbal
 *
 * @Arguments: [disable BOOL]
 * @Return: void
 * @PublicAPI: false
 */

#include "script_component.hpp"

private["_disable"];
_disable = [_this, 0, false, [false]] call BIS_fnc_Param;
if (!hasInterface) exitwith {};
CSE_DISABLE_KEY_INPUT_F = _disable;

[format["Disable Key input: %1",_disable]] call FUNC(debug);
if (_disable) then {
	if (isNil QGVAR(DISABLE_KEY_UP_INPUT_DISPLAY_EH_F)) then {
		[format["Keyinput has not yet been disabled, now disabling",_disable]] call FUNC(debug);

		GVAR(DISABLE_USER_INPUT_SCREEN) = true;
		createDialog QGVAR(empty_screen);
		disableSerialization;
		_display = uiNamespace getvariable QGVAR(empty_screen);
		GVAR(DISABLE_KEY_UP_INPUT_DISPLAY_EH_F) = _display displayAddEventHandler ["KeyDown", {
			_return = true;
			if ((_this select 1) == 1) then {
				if (isNull finddisplay 49) then {
					[format["Assigning ctrlEventhandlers to buttons"]] call FUNC(debug);
					if (isMultiplayer) then {
						createDialog "RscDisplayMPInterrupt";
						_ctrl = (finddisplay 49) displayctrl 103;
						_ctrl ctrlSetEventHandler ["buttonClick", "closeDialog 0; [false] call FUNC(disableKeyInput_f); failMission 'LOSER';"];

						_ctrl = (finddisplay 49) displayctrl 104;
						_ctrl ctrlSetEventHandler ["buttonClick", "closeDialog 0; [false] call FUNC(disableKeyInput_f); player setDamage 1;"];
					} else {
						createDialog "RscDisplayInterrupt";
						_ctrl = (finddisplay 49) displayctrl 104;
						_ctrl ctrlSetEventHandler ["buttonClick", "closeDialog 0; [false] call FUNC(disableKeyInput_f); failMission 'LOSER';"];
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
			[format["Returning %1 for disable key input keyDown handler", _return]] call FUNC(debug);
			_return;
		}];
		GVAR(DISABLE_KEY_DOWN_INPUT_DISPLAY_EH_F) = _display displayAddEventHandler ["KeyUp", {true;}];
	};
} else {
	if (!isNil QGVAR(DISABLE_KEY_UP_INPUT_DISPLAY_EH_F)) then {
		[format["Keyinput has been disabled, now enabling",_disable]] call FUNC(debug);
		GVAR(DISABLE_USER_INPUT_SCREEN) = nil;
		disableSerialization;
		_display = uiNamespace getvariable QGVAR(empty_screen);
		if (isnil "_display") then {
			_display = displayNull;
		};
		closeDialog 679123;
		_display closeDisplay 1;
		_display displayRemoveEventHandler ["KeyDown", GVAR(DISABLE_KEY_UP_INPUT_DISPLAY_EH_F)];
		_display displayRemoveEventHandler ["KeyUp", GVAR(DISABLE_KEY_DOWN_INPUT_DISPLAY_EH_F)];
		GVAR(DISABLE_KEY_DOWN_INPUT_DISPLAY_EH_F) = nil;
		GVAR(DISABLE_KEY_UP_INPUT_DISPLAY_EH_F) = nil;
	};
};

[[_disable], "disableKeyInput"] call FUNC(customEventHandler_F);