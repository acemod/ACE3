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

params ["_mode",["_args",[]]];

switch (toLower _mode) do {
    // Safely open/close the interface
    case "open": {
        // Prevent reopening
        if !(isNull (GETUVAR(GVAR(display),displayNull))) exitWith {};

        // Initalize camera variables
        GVAR(camBank) = 0;
        GVAR(camBoom) = [false,false];
        GVAR(camDolly) = [false,false,false,false];
        GVAR(camPos) set [2,20];
        GVAR(camTilt) = -10;
        GVAR(gunCam) = false;

        // Initalize display variables
        GVAR(ctrlKey) = false;
        GVAR(mouse) = [false,false];
        GVAR(mousePos) = [0.5,0.5];

        // Initalize the camera view
        GVAR(camera) = "Camera" camCreate GVAR(camPos);
        GVAR(camera) setDir GVAR(camPan);
        [] call FUNC(updateCamera);

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
        GVAR(camTilt) = nil;
        GVAR(gunCam) = nil;

        // Cleanup display variables
        GVAR(ctrlKey) = nil;
        GVAR(mouse) = nil;
        GVAR(mousePos) = nil;

        // Reset nametag settings
        if (["ace_nametags"] call EFUNC(common,isModLoaded)) then {
            EGVAR(nametags,showPlayerNames) = GVAR(nametagSettingCache) select 0;
            EGVAR(nametags,showNamesForAI) = GVAR(nametagSettingCache) select 1;
            GVAR(nametagSettingCache) = nil;
        };
    };
    // Dialog events
    case "onload": {
        _args params ["_display"];

        with uiNamespace do {
            GVAR(display) = _display;
        };

        // Always show interface and hide map upon opening
        GVAR(showInterface) = true;
        GVAR(showMap) = false;
        [] call FUNC(updateInterface);

        // Keep unit tree up to date
        [FUNC(handleUnits), 21, _display] call CBA_fnc_addPerFrameHandler;

        // Handle the compass heading
        [FUNC(handleCompass), 0, _display] call CBA_fnc_addPerFrameHandler;

        // Handle the toolbar values
        [FUNC(handleToolbar), 0, _display] call CBA_fnc_addPerFrameHandler;

        // Hacky way to enable keybindings
        //_display displayAddEventHandler ["KeyUp", {[_this,'keyup'] call CBA_events_fnc_keyHandler}];
        //_display displayAddEventHandler ["KeyDown", {[_this,'keydown'] call CBA_events_fnc_keyHandler}];
    };
    case "onunload": {
        with uiNamespace do {
            GVAR(display) = nil;
        };

        GVAR(camHandler) = nil;
    };
    // Mouse events
    case "onmousebuttondown": {
        _args params ["_ctrl","_button"];
        GVAR(mouse) set [_button,true];

        // Detect right click
        if ((_button == 1) && (GVAR(camMode) == 1)) then {
            // In first person toggle sights mode
            GVAR(gunCam) = !GVAR(gunCam);
            [] call FUNC(updateCamera);
        };
    };
    case "onmousebuttonup": {
        _args params ["_ctrl","_button"];

        GVAR(mouse) set [_button,false];
    };
    case "onmousezchanged": {
        _args params ["_ctrl","_zChange"];

        // Scroll to change speed, modifier for zoom
        if (GVAR(ctrlKey)) then {
            GVAR(camZoom) = ((GVAR(camZoom) + _zChange * 0.1) max 0.01) min 2;
        } else {
            GVAR(camSpeed) = (GVAR(camSpeed) + _zChange * 0.2) max 0.05;
        };
    };
    case "onmousemoving": {
        _args params ["_ctrl","_x","_y"];

        [_x,_y] call FUNC(handleMouse);
    };
    // Keyboard events
    case "onkeydown": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];

        switch (_dik) do {
            case 1: { // Esc
               [player,false] call FUNC(setSpectator); // Handle esc menu goes here, currently closes for purposes of testing
            };
            case 2: { // 1
                GVAR(showUnit) = !GVAR(showUnit);
                [] call FUNC(updateInterface);
            };
            case 3: { // 2
                GVAR(showTool) = !GVAR(showTool);
                [] call FUNC(updateInterface);
            };
            case 4: { // 3
                GVAR(showComp) = !GVAR(showComp);
                [] call FUNC(updateInterface);
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
            case 44: { // Z
                GVAR(camBoom) set [1,true];
            };
            case 50: { // M
                GVAR(showMap) = !GVAR(showMap);
                [] call FUNC(updateInterface);
                //[_show] call FUNC(handleMap);
            };
            case 57: { // Spacebar
                // Freecam attachment here, if in external then set cam pos and attach
            };
            case 200: { // Up arrow
                [[2,0,1] select GVAR(camMode)] call FUNC(updateCamera);
            };
            case 203: { // Left arrow

            };
            case 205: { // Right arrow

            };
            case 208: { // Down arrow
                [[1,2,0] select GVAR(camMode)] call FUNC(updateCamera);
            };
        };

        true
    };
    case "onkeyup": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];

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
        _args params ["_tree","_sel"];

        // Ensure a unit was selected
        if (count _sel == 2) then {
            private ["_netID","_newUnit","_newMode"];
            _netID = (_args select 0) tvData _sel;
            _newUnit = objectFromNetId _netID;

            // When unit is reselected, toggle camera mode
            if (_newUnit == GVAR(camUnit) || GVAR(camMode) == 0) then {
                _newMode = [2,2,1] select GVAR(camMode);
            };

            [_newMode,_newUnit] call FUNC(updateCamera);
        };
    };
    case "onunitsupdate": {
        _args params ["_display"];
        private ["_ctrl","_curSelData","_cachedGrps","_grp","_node","_side","_index"];

        // Fetch tree
        _ctrl = _display displayCtrl IDC_UNIT;

        // Cache current selection
        _curSelData = _ctrl tvData (tvCurSel _ctrl);

        // Clear the tree
        tvClear _ctrl;

        // Update the tree from the unit list
        _cachedGrps = [];
        {
            _grp = group _x;
            _node = 0;
            // If group already exists, find existing node
            if !(_grp in _cachedGrps) then {
                _side = [west,east,resistance,civilian,sideLogic] find (side _grp);
                _node = _ctrl tvCount [];

                _ctrl tvAdd [[], groupID _grp];
                _ctrl tvSetValue [[_node], _side];

                _cachedGrps pushBack _grp;
            } else {
                _node = _cachedGrps find _grp;
            };

            _index = _ctrl tvCount [_node];

            _ctrl tvAdd [[_node], name _x];
            _ctrl tvSetData [[_node,_index], netID _x];

            // Preserve the previous selection
            if (_curSelData == (_ctrl tvData [_node,_index])) then {
                _ctrl tvSetCurSel [_node,_index];
            };

            _ctrl tvSort [[_node],false];
            _ctrl tvExpand [_node];
        } forEach GVAR(unitList);

        // Sort group nodes by side
        _ctrl tvSortByValue [[],false];
    };
};
