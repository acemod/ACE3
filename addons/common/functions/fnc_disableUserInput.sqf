#include "..\script_component.hpp"
#include "\a3\ui_f_curator\ui\defineResinclDesign.inc"
/*
 * Author: commy2
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

    // end TFAR and ACRE2 radio transmissions
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

        _display displayAddEventHandler ["KeyDown", {
            params ["", "_key"];

            if (_key == 1 && {alive player}) then {
                createDialog (["RscDisplayInterrupt", "RscDisplayMPInterrupt"] select isMultiplayer);

                disableSerialization;

                private _dlg = findDisplay 49;

                for "_index" from 100 to 2000 do {
                    (_dlg displayCtrl _index) ctrlEnable false;
                };

                private _ctrl = _dlg displayctrl 103;
                _ctrl ctrlSetEventHandler ["buttonClick", QUOTE(while {!isNull (uiNamespace getVariable [ARR_2(QUOTE(QGVAR(dlgDisableMouse)),displayNull)])} do {closeDialog 0}; failMission 'LOSER'; [false] call DFUNC(disableUserInput))];
                _ctrl ctrlEnable true;
                _ctrl ctrlSetText "ABORT";
                _ctrl ctrlSetTooltip "Abort.";

                _ctrl = _dlg displayctrl ([104, 1010] select isMultiplayer);
                if (["ace_medical"] call FUNC(isModLoaded)) then {
                    _ctrl ctrlSetEventHandler ["buttonClick", 'closeDialog 0; [player, "respawn_button"] call EFUNC(medical_status,setDead); [false] call DFUNC(disableUserInput);'];
                } else {
                    _ctrl ctrlSetEventHandler ["buttonClick", QUOTE(closeDialog 0; player setDamage 1; [false] call DFUNC(disableUserInput))];
                };
                _ctrl ctrlEnable ((getMissionConfigValue ["respawnButton", -1]) != 0); // handles 3den attribute or description.ext
                _ctrl ctrlSetText localize "$str_3den_multiplayer_attributecategory_respawn_displayname";
                _ctrl ctrlSetTooltip "Respawn.";
            };

            if (_key in actionKeys "TeamSwitch" && {teamSwitchEnabled}) then {
                (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;

                private _acc = accTime;
                teamSwitch;
                setAccTime _acc;
            };

            if (_key in actionKeys "CuratorInterface" && {getAssignedCuratorLogic player in allCurators}) then {
                (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;
                openCuratorInterface;
            };

            if (_key in actionKeys "ShowMap" && {player getVariable ["ACE_canSwitchUnits", false]}) then {
                (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;
                openMap true;
            };

            if (isServer || {serverCommandAvailable "#kick"}) then {
                if (!(_key in (actionKeys "DefaultAction" + actionKeys "Throw")) && {_key in (actionKeys "Chat" + actionKeys "PrevChannel" + actionKeys "NextChannel")}) then {
                    _key = 0;
                };
            };

            _key > 0
        }];

        _display displayAddEventHandler ["KeyUp", {true}];
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
};
