/*
 * Author: SilentSpike
 * Handles spectator interface events
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event arguments <ANY>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * ["onLoad",_this] call ace_spectator_fnc_handleInterface
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_mode","_args"];

_mode = _this select 0;
_args = if (count _this > 1) then {_this select 1} else {[]};

switch (toLower _mode) do {
    // Safely open/close the interface
    case "open": {
        // Prevent reopening
        if !(isNull (GETUVAR(GVAR(display),displayNull))) exitWith {};

        // Initalize preserved variables
        if (isNil QGVAR(savedSpots)) then { GVAR(savedSpots) = []; };
        if (isNil QGVAR(savedUnits)) then { GVAR(savedUnits) = []; };

        // Initalize the camera view
        GVAR(camera) = "Camera" camCreate GVAR(camPos);
        GVAR(camera) setDir GVAR(camDir);
        GVAR(camera) cameraEffect ["internal", "back"];

        // Create the dialog
        createDialog QGVAR(overlay);

        // Cache and disable nametag settings
        if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
            GVAR(nametagSettingCache) = [EGVAR(nametags,showPlayerNames), EGVAR(nametags,showNamesForAI)];
            EGVAR(nametags,showPlayerNames) = 0;
            EGVAR(nametags,showNamesForAI) = false;
        };
    };
    case "close": {
        // Can't close a second time
        if (isNull (GETUVAR(GVAR(display),displayNull))) exitWith {};

        // Terminate interface
        (GETUVAR(GVAR(display),displayNull)) closeDisplay 0;

        // Terminate camera
        GVAR(camera) cameraEffect ["terminate", "back"];
        camDestroy GVAR(camera);

        // Return to player view
        ACE_Player switchCamera "internal";

        // Reset nametag settings
        if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
            EGVAR(nametags,showPlayerNames) = GVAR(nametagSettingCache) select 0;
            EGVAR(nametags,showNamesForAI) = GVAR(nametagSettingCache) select 1;
            GVAR(nametagSettingCache) = nil;
        };
    };
    // Dialog events
    case "onload": {
        with uiNamespace do {
            GVAR(display) = _args select 0;
        };

        // Initalize the display
        _display = _args select 0;

        // Hide the map
        (_display displayCtrl IDC_MAP) ctrlShow false;
        (_display displayCtrl IDC_MAP) mapCenterOnCamera false;

        // Populate unit tree
        //["onload",_display displayCtrl IDC_TREE] call FUNC(handleTree);

        // Hacky way to enable keybindings
        //_display displayAddEventHandler ["KeyUp", {[_this,'keyup'] call CBA_events_fnc_keyHandler}];
        //_display displayAddEventHandler ["KeyDown", {[_this,'keydown'] call CBA_events_fnc_keyHandler}];
    };
    case "onunload": {
        with uiNamespace do {
            GVAR(display) = nil;
        };
    };
    // Keyboard events
    case "onkeydown": {
        private ["_display","_dik","_shift","_ctrl","_alt"];
        _display = _args select 0;
        _dik = _args select 1;
        _shift = _args select 2;
        _ctrl = _args select 3;
        _alt = _args select 4;

        switch (_dik) do {
            case 1: { // Esc
                // Handle esc menu
            };
            case 14: { // Backspace
                private ["_tree","_show"];
                _tree = _display displayCtrl IDC_TREE;
                _show = !ctrlShown _tree;

                _tree ctrlShow _show;
            };
            case 50: { // M
                private ["_map","_show"];
                _map = _display displayCtrl IDC_MAP;
                _show = !ctrlShown _map;

                _map ctrlShow _show;
                _map mapCenterOnCamera _show;
                //[_show] call FUNC(handleMap);
            };
        };

        true
    };
    case "onkeyup": {
        private ["_dik","_shift","_ctrl","_alt"];
        _dik = _args select 1;
        _shift = _args select 2;
        _ctrl = _args select 3;
        _alt = _args select 4;

        switch (_dik) do {
        };

        true
    };
};
