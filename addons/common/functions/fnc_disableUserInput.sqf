#include "script_component.hpp"
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

params ["_state"];

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

    closeDialog 0;
    createDialog QGVAR(DisableMouse_Dialog);

    private _dlg = uiNamespace getVariable QGVAR(dlgDisableMouse);

    _dlg displayAddEventHandler ["KeyDown", {
        params ["", "_key"];

        if (_key == 1 && {alive player}) then {
            createDialog (["RscDisplayInterrupt", "RscDisplayMPInterrupt"] select isMultiplayer);

            disableSerialization;

            private _dlg = findDisplay 49;

            for "_index" from 100 to 2000 do {
                (_dlg displayCtrl _index) ctrlEnable false;
            };

            private _ctrl = _dlg displayctrl 103;
            _ctrl ctrlSetEventHandler ["buttonClick", QUOTE(while {!isNull (uiNamespace getVariable [ARR_2(QUOTE(QGVAR(dlgDisableMouse)),displayNull)])} do {closeDialog 0}; failMission 'LOSER'; [false] call DFUNC(disableUserInput);)];
            _ctrl ctrlEnable true;
            _ctrl ctrlSetText "ABORT";
            _ctrl ctrlSetTooltip "Abort.";

            _ctrl = _dlg displayctrl ([104, 1010] select isMultiplayer);
            _ctrl ctrlSetEventHandler ["buttonClick", QUOTE(closeDialog 0; player setDamage 1; [false] call DFUNC(disableUserInput);)];
            _ctrl ctrlEnable (call {private _config = missionConfigFile >> "respawnButton"; !isNumber _config || {getNumber _config == 1}});
            _ctrl ctrlSetText "RESPAWN";
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

        if (isServer || {serverCommandAvailable "#kick"} || {player getVariable ["ACE_isUnconscious", false] && {(call FUNC(player)) getVariable [QEGVAR(medical,AllowChatWhileUnconscious), missionNamespace getVariable [QEGVAR(medical,AllowChatWhileUnconscious), false]]}}) then {
            if (!(_key in (actionKeys "DefaultAction" + actionKeys "Throw")) && {_key in (actionKeys "Chat" + actionKeys "PrevChannel" + actionKeys "NextChannel")}) then {
                _key = 0;
            };
        };

        _key > 0
    }];

    _dlg displayAddEventHandler ["KeyUp", {true}];

    GVAR(disableInputPFH) = [{
        if (isNull (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) && {!visibleMap && isNull findDisplay 49 && isNull findDisplay 312 && isNull findDisplay 632}) then {
            [GVAR(disableInputPFH)] call CBA_fnc_removePerFrameHandler;
            GVAR(disableInputPFH) = nil;
            [true] call FUNC(disableUserInput);
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
} else {
    if (!isNil QGVAR(disableInputPFH)) then {
        [GVAR(disableInputPFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(disableInputPFH) = nil;
    };

    (uiNamespace getVariable [QGVAR(dlgDisableMouse), displayNull]) closeDisplay 0;
};
