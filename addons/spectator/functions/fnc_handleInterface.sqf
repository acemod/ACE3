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
        if (isNil QGVAR(camMode)) then { GVAR(camMode) = 0; };
        if (isNil QGVAR(camPan)) then { GVAR(camPan) = 0; };
        if (isNil QGVAR(camPos)) then { GVAR(camPos) = getPos cameraOn; };
        if (isNil QGVAR(camUnit)) then { GVAR(camUnit) = objNull; };

        // Initalize camera variables
        GVAR(camBank) = 0;
        GVAR(camBoom) = [false,false];
        GVAR(camDolly) = [false,false,false,false];
        GVAR(camFocus) = [-1,-1];
        GVAR(camFOV) = 0.7;
        GVAR(camPos) set [2,20];
        GVAR(camSpeed) = 1;
        GVAR(camTilt) = -10;
        GVAR(camZoom) = 3;
        GVAR(gunCam) = false;

        // Initalize display variables
        GVAR(ctrlKey) = false;
        GVAR(mouse) = [false,false];
        GVAR(mouseDelta) = [0.5,0.5];
        GVAR(mousePos) = [0.5,0.5];
        GVAR(mousePosOld) = [0.5,0.5];

        // Initalize the camera view
        GVAR(camera) = "Camera" camCreate GVAR(camPos);
        GVAR(camera) setDir GVAR(camPan);
        [] call FUNC(updateView);

        GVAR(camera) camSetFOV GVAR(camFOV);

        // Handle camera movement
        [FUNC(handleCamera), 0] call CBA_fnc_addPerFrameHandler;

        // Populate the unit list
        [] call FUNC(updateUnits);

        // Create the dialog
        createDialog QGVAR(interface);

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

        // Cleanup camera variables
        GVAR(camera) = nil;
        GVAR(camBank) = nil;
        GVAR(camBoom) = nil;
        GVAR(camDolly) = nil;
        GVAR(camFocus) = nil;
        GVAR(camFOV) = nil;
        GVAR(camSpeed) = nil;
        GVAR(camTilt) = nil;
        GVAR(camZoom) = nil;
        GVAR(gunCam) = nil;

        // Cleanup display variables
        GVAR(mouse) = nil;
        GVAR(mouseDelta) = nil;
        GVAR(mousePos) = nil;
        GVAR(mousePosOld) = nil;

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

        // Always show interface and hide map upon opening
        GVAR(showInterface) = true;
        GVAR(showMap) = false;
        [] call FUNC(updateInterface);

        // Set text values
        (_display displayCtrl IDC_TOOL_FOCUS) ctrlSetText str(GVAR(camFocus));
        (_display displayCtrl IDC_TOOL_FOV) ctrlSetText str(GVAR(camFOV));
        (_display displayCtrl IDC_TOOL_SPEED) ctrlSetText format ["%1 m/s",GVAR(camSpeed)];
        (_display displayCtrl IDC_TOOL_VIEW) ctrlSetText (["FREE","FIRST","THIRD"] select GVAR(camMode));

        // Keep unit tree up to date
        [FUNC(handleTree), 10] call CBA_fnc_addPerFrameHandler;

        // Hacky way to enable keybindings
        //_display displayAddEventHandler ["KeyUp", {[_this,'keyup'] call CBA_events_fnc_keyHandler}];
        //_display displayAddEventHandler ["KeyDown", {[_this,'keydown'] call CBA_events_fnc_keyHandler}];
    };
    case "onunload": {
        with uiNamespace do {
            GVAR(display) = nil;
        };
    };
    // Mouse events
    case "onmousebuttondown": {
        private ["_button"];
        _button = _args select 1;
        GVAR(mouse) set [_button,true];

        // Detect right click
        if ((_button == 1) && (GVAR(camMode) == 1)) then {
            // In first person toggle sights mode
            GVAR(gunCam) = !GVAR(gunCam);
            [] call FUNC(updateView);
        };
    };
    case "onmousebuttonup": {
        private ["_button"];
        _button = _args select 1;
        GVAR(mouse) set [_button,false];
    };
    case "onmousezchanged": {
        private ["_zChange"];
        _zChange = _args select 1;

        // Scroll to zoom in 3rd person, modifier for FOV
        if (GVAR(ctrlKey)) then {
            GVAR(camFOV) = ((GVAR(camFOV) - (_zChange * GVAR(camFOV) * 0.2)) max 0.1) min 1;
        } else {
            GVAR(camZoom) = (GVAR(camZoom) - (_zChange * GVAR(camZoom) * 0.2)) max 0.1;
        };
        [] call FUNC(handleCamera);
    };
    case "onmousemoving": {
        private ["_x","_y"];
        _x = _args select 1;
        _y = _args select 2;

        GVAR(mousePos) = [_x,_y];
        [] call FUNC(handleMouse);
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
               [player,false] call FUNC(setSpectator); // Handle esc menu goes here, currently closes for purposes of testing
            };
            case 14: { // Backspace
                GVAR(showInterface) = !GVAR(showInterface);
                [] call FUNC(updateInterface);
            };
            case 16: { // Q
                GVAR(camBoom) set [0,true];
            };
            case 17: { // W
                GVAR(camDolly) set [0,true];
            };
            case 20: { // T
                GVAR(showTool) = !GVAR(showTool);
                [] call FUNC(updateInterface);
            };
            case 22: { // U
                GVAR(showUnit) = !GVAR(showUnit);
                [] call FUNC(updateInterface);
            };
            case 29: { // Ctrl
                GVAR(ctrlKey) = true;
            };
            case 30: { // A
                GVAR(camDolly) set [2,true];
            };
            case 31: { // S
                GVAR(camDolly) set [1,true];
            };
            case 32: { // D
                GVAR(camDolly) set [3,true];
            };
            case 35: { // H
                GVAR(showHelp) = !GVAR(showHelp);
                [] call FUNC(updateInterface);
            };
            case 37: { // K
                GVAR(showComp) = !GVAR(showComp);
                [] call FUNC(updateInterface);
            };
            case 44: { // Z
                GVAR(camBoom) set [1,true];
            };
            case 50: { // M
                GVAR(showMap) = !GVAR(showMap);
                [] call FUNC(updateInterface);
                //[_show] call FUNC(handleMap);
            };
            case 57: { // Spacebar
                [[2,0,1] select GVAR(camMode)] call FUNC(updateView);
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
            case 16: { // Q
                GVAR(camBoom) set [0,false];
            };
            case 17: { // W
                GVAR(camDolly) set [0,false];
            };
            case 29: { // Ctrl
                GVAR(ctrlKey) = false;
            };
            case 30: { // A
                GVAR(camDolly) set [2,false];
            };
            case 31: { // S
                GVAR(camDolly) set [1,false];
            };
            case 32: { // D
                GVAR(camDolly) set [3,false];
            };
            case 44: { // Z
                GVAR(camBoom) set [1,false];
            };
        };

        true
    };
    // Tree events
    case "ontreedblclick": {
        // Update camera view when listbox unit is double clicked on
        private ["_sel","_netID","_newUnit","_newMode"];
        _sel = _args select 1;

        // Ensure a unit was selected
        if (count _sel == 2) then {
            _netID = (_args select 0) tvData _sel;
            _newUnit = objectFromNetId _netID;

            // When unit is reselected, toggle camera mode
            if (_newUnit == GVAR(camUnit) || GVAR(camMode) == 0) then {
                _newMode = [2,2,1] select GVAR(camMode);
            };

            [_newMode,_newUnit] call FUNC(updateView);
        };
    };
};
