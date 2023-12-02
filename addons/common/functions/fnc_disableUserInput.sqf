#include "..\script_component.hpp"
#include "\a3\ui_f_curator\ui\defineResinclDesign.inc"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: commy2, johnb43
 * Disables key input. ESC can still be pressed to open the menu.
 *
 * Arguments:
 * 0: True to disable key inputs, false to re-enable them <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_common_fnc_disableUserInput
 *
 * Public: No
 */

#define IDD_TEAMSWITCH 632

params ["_state"];
TRACE_1("disableUserInput",_state);

if (_state) then {
    disableSerialization;

    if (!isNull (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull])) exitWith {};
    if (!isNil QGVAR(disableInputPFH)) exitWith {};

    // End TFAR and ACRE2 radio transmissions
    call FUNC(endRadioTransmission);

    // Close map
    if (visibleMap && {!(player getVariable ["ACE_canSwitchUnits", false])}) then {
        openMap false;
    };

    if (isNull findDisplay IDD_INTERRUPT && {isNull findDisplay IDD_RSCDISPLAYCURATOR} && {isNull findDisplay IDD_TEAMSWITCH}) then {
        closeDialog 0;
        createDialog QGVAR(DisableMouse_Dialog);

        private _display = uiNamespace getVariable QGVAR(dlgDisableMouse);

        // Hide cursor by using custom transparent cursor
        private _map = _display displayCtrl 101;
        _map ctrlMapCursor ["", QGVAR(blank)];

        GVAR(keyboardInputMain) = createHashMap;
        GVAR(keyboardInputCombo) = createHashMap;

        _display displayAddEventHandler ["KeyDown", {
            // If input is enabled again, ignore
            if (isNil QGVAR(keyboardInputMain)) exitWith {};

            params ["", "_key"];

            // Get key info; Stored as [isPressed, pressedCount]
            private _keyPressedInfo = GVAR(keyboardInputMain) getOrDefault [_key, [false, 0], true];
            _keyPressedInfo params ["_keyPressed", "_keyPressedCount"];

            // For regular keys: If pressed, set to release and remove one key press
            if (!_keyPressed) then {
                _keyPressedInfo set [0, true];
                _keyPressedInfo set [1, _keyPressedCount + 1];
            };

            // For combo keys, register only if pushed or released (no keypress count)
            if !(GVAR(keyboardInputCombo) getOrDefault [_key, false]) then {
                GVAR(keyboardInputCombo) set [_key, true];
            };

            // Look if keybinds of various actions have been pressed
            private _action = "";
            private _comboDikPressed = false;
            private _return = false;

            // This technique has a limitation: It can't process the Escape key properly (KeyUp EH does not fire)
            (["TeamSwitch", "CuratorInterface", "ShowMap", "DefaultAction", "Throw", "Chat", "PrevChannel", "NextChannel"] apply {
                _action = _x;

                {
                    _x params ["_mainKeyArray", "_comboKeyArray", "_isDoubleTap"];
                    _mainKeyArray params ["_mainDik", "_mainDevice"];

                    // If keybind doesn't contain key combo, it returns empty array; Therefore, return true
                    _comboDikPressed = if (_comboKeyArray isEqualTo []) then {
                        true
                    } else {
                        _comboKeyArray params ["_comboDik", "_comboDevice"];

                        _comboDevice == "KEYBOARD" && {GVAR(keyboardInputCombo) getOrDefault [_comboDik, false]}
                    };

                    // Check if the necessary keys were pressed for a keybind
                    _return = _comboDikPressed &&
                        {_mainDevice == "KEYBOARD"} &&
                        {((GVAR(keyboardInputMain) getOrDefault [_mainDik, [false, 0]]) select 1) > ([0, 1] select _isDoubleTap)}; // check how many times the main key was pressed

                    // Keybind was detected
                    if (_return) exitWith {
                        TRACE_1("Action triggered: ",_action);
                    };
                } forEach (actionKeysEx _action);

                _return
            }) params ["_teamSwitch", "_curatorInterface", "_showMap", "_defaultAction", "_throw", "_chat", "_prevChannel", "_nextChannel"];

            // Handle Escape separately because of limitation mentioned above
            if (_key == DIK_ESCAPE && {alive player}) then {
                disableSerialization;

                private _isMultiplayer = isMultiplayer;
                private _is3DENPreview = is3DENPreview;

                createDialog (["RscDisplayInterrupt", "RscDisplayMPInterrupt"] select _isMultiplayer);

                private _dlg = findDisplay 49;

                for "_index" from 100 to 2000 do {
                    (_dlg displayCtrl _index) ctrlEnable false;
                };

                private _ctrl = _dlg displayCtrl 103;
                _ctrl ctrlSetEventHandler ["ButtonClick", toString {
                    while {!isNull (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull])} do {
                        closeDialog 0
                    };

                    failMission "LOSER";

                    [false] call FUNC(disableUserInput);
                }];
                _ctrl ctrlEnable true;
                _ctrl ctrlSetText localize (["str_disp_int_abort", "STR_3DEN_RscDisplayInterrupt_ButtonAbort_3DEN_text"] select (_is3DENPreview && !_isMultiplayer));
                _ctrl ctrlSetTooltip localize ([
                    "STR_TOOLTIP_MAIN_ABORT_CAMPAIGN",
                    "STR_3DEN_RscDisplayInterrupt_ButtonAbort_3DEN_tooltip",
                    "STR_TOOLTIP_MAIN_ABORT"
                ] select (([_is3DENPreview, _isMultiplayer] call FUNC(toBitmask)) min 2));

                _ctrl = _dlg displayCtrl ([104, 1010] select _isMultiplayer);
                _ctrl ctrlSetEventHandler ["ButtonClick", toString {
                    closeDialog 0;

                    if (["ace_medical"] call FUNC(isModLoaded)) then {
                        [player, "respawn_button"] call EFUNC(medical_status,setDead);
                    } else {
                        player setDamage 1;
                    };

                    [false] call FUNC(disableUserInput);
                }];

                private _respawnEnabled = (getMissionConfigValue ["respawnButton", -1]) != 0;

                _ctrl ctrlEnable _respawnEnabled; // handles 3den attribute or description.ext
                _ctrl ctrlSetText localize "str_disp_int_respawn";
                _ctrl ctrlSetTooltip localize (["str_3den_attributes_respawn_none_tooltip", "str_disp_int_respawn"] select _respawnEnabled);
            };

            if (_teamSwitch && teamSwitchEnabled) then {
                (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;

                private _acc = accTime;
                teamSwitch;
                setAccTime _acc;
            };

            if (_curatorInterface && {!isNull getAssignedCuratorLogic player}) then {
                (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;

                openCuratorInterface;
            };

            if (_showMap && {player getVariable ["ACE_canSwitchUnits", false]}) then {
                (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;

                openMap true;
            };

            if (isMultiplayer && {isServer || {serverCommandAvailable "#kick"}}) then {
                if (!(_defaultAction || _throw) && {_chat || _prevChannel || _nextChannel}) then {
                    _key = 0;
                };
            };

            _key > 0
        }];

        _display displayAddEventHandler ["KeyUp", {
            // If input is enabled again, ignore
            if (isNil QGVAR(keyboardInputMain)) exitWith {};

            params ["", "_key"];

            // For combo keys: If pressed, release
            if (GVAR(keyboardInputCombo) getOrDefault [_key, false]) then {
                GVAR(keyboardInputCombo) deleteAt _key;
            };

            private _keyPressedInfo = GVAR(keyboardInputMain) getOrDefault [_key, [false, 0]];

            // If pressed, release it
            if (_keyPressedInfo select 0) then {
                _keyPressedInfo set [0, false];
            };

            // Cache keystrokes of regular keys for a small amount of time
            [{
                // If input is enabled again, ignore
                if (isNil QGVAR(keyboardInputMain)) exitWith {};

                params ["_key"];

                private _keyPressedInfo = GVAR(keyboardInputMain) getOrDefault [_key, [false, 0]];

                // Release it
                _keyPressedInfo set [1, ((_keyPressedInfo select 1) - 1) max 0];

                if (_keyPressedInfo isEqualTo [false, 0]) then {
                    GVAR(keyboardInputMain) deleteAt _key,
                };
            }, _key, 0.5] call CBA_fnc_waitAndExecute;
        }];
    };

    GVAR(disableInputPFH) = [{
        if (isNull (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) && {!visibleMap && {isNull findDisplay IDD_INTERRUPT} && {isNull findDisplay IDD_RSCDISPLAYCURATOR} && {isNull findDisplay IDD_TEAMSWITCH}}) exitWith {
            [GVAR(disableInputPFH)] call CBA_fnc_removePerFrameHandler;
            GVAR(disableInputPFH) = nil;
            [true] call FUNC(disableUserInput);
        };

        // Allow user input if the player is respawning and a respawn template (menu position or spectator)
        // is open (otherwise they cannot click the respawn button)
        if (
            !alive player
            && {playerRespawnTime != -1}
            && {
                missionNamespace getVariable ["BIS_RscRespawnControlsMap_shown", false]
                || {missionNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]}
            }
        ) exitWith {
            [false] call FUNC(disableUserInput);
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
} else {
    if (!isNil QGVAR(disableInputPFH)) then {
        [GVAR(disableInputPFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(disableInputPFH) = nil;
    };

    (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;

    GVAR(keyboardInputMain) = nil;
    GVAR(keyboardInputCombo) = nil;
};
