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
        GVAR(camBoom) = 0;
        GVAR(camDolly) = [0,0];
        GVAR(camGun) = false;

        // Initalize display variables
        GVAR(ctrlKey) = false;
        GVAR(heldKeys) = [];
        GVAR(mouse) = [false,false];
        GVAR(mousePos) = [0.5,0.5];

        // Initalize the camera view
        GVAR(camera) = "Camera" camCreate (ASLtoATL GVAR(camPos));
        [] call FUNC(transitionCamera);

        // Close all existing dialogs
        while {dialog} do {
            closeDialog 0;
        };

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
        GVAR(camBoom) = nil;
        GVAR(camDolly) = nil;
        GVAR(camGun) = nil;

        // Cleanup display variables
        GVAR(ctrlKey) = nil;
        GVAR(heldKeys) = nil;
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
        [_display,nil,nil,!GVAR(showInterface),GVAR(showMap)] call FUNC(toggleInterface);

        // Keep unit list and tree up to date
        [FUNC(handleUnits), 21, _display] call CBA_fnc_addPerFrameHandler;

        // Populate the help splash
        private "_help";
        _help = (_display displayCtrl IDC_HELP) controlsGroupCtrl IDC_HELP_LIST;
        {
            // Add space before category titles
            if (count _x == 1) then {
                _help lnbAddRow [""];
            };

            _help lnbAddRow _x;
        } forEach [
            [localize LSTRING(uiControls),""],
            [localize LSTRING(uiToggleHelp),"H"],
            [localize LSTRING(uiToggleMap),"M"],
            [localize LSTRING(uiToggleUnits),"1"],
            [localize LSTRING(uiToggleTools),"2"],
            [localize LSTRING(uiToggleCompass),"3"],
            [localize LSTRING(uiToggleIcons),"4"],
            [localize LSTRING(uiToggleInterface),"Backspace"],

            [localize LSTRING(freeCamControls)],
            [localize LSTRING(freeCamForward),"W"],
            [localize LSTRING(freeCamBackward),"S"],
            [localize LSTRING(freeCamLeft),"A"],
            [localize LSTRING(freeCamRight),"D"],
            [localize LSTRING(freeCamUp),"Q"],
            [localize LSTRING(freeCamDown),"Z"],
            [localize LSTRING(freeCamPan),"RMB (Hold)"],
            [localize LSTRING(freeCamDolly),"LMB (Hold)"],
            [localize LSTRING(freeCamSpeed),"Scrollwheel"],
            [localize LSTRING(freeCamZoom),"Ctrl + Scrollwheel"],
            [localize LSTRING(freeCamNextVis),"N"],
            [localize LSTRING(freeCamPrevVis),"Ctrl + N"],

            [localize LSTRING(otherControls)],
            [localize LSTRING(nextCam),"Up Arrow"],
            [localize LSTRING(prevCam),"Down Arrow"],
            [localize LSTRING(nextUnit),"Right Arrow"],
            [localize LSTRING(prevUnit),"Left Arrow"]
        ];

        // Hacky way to enable keybindings
        //_display displayAddEventHandler ["KeyUp", {[_this,'keyup'] call CBA_events_fnc_keyHandler}];
        //_display displayAddEventHandler ["KeyDown", {[_this,'keydown'] call CBA_events_fnc_keyHandler}];
    };
    case "onunload": {
        with uiNamespace do {
            GVAR(display) = nil;
        };

        GVAR(camHandler) = nil;
        GVAR(compHandler) = nil;
        GVAR(iconHandler) = nil;
        GVAR(toolHandler) = nil;
    };
    // Mouse events
    case "onmousebuttondown": {
        _args params ["_ctrl","_button"];
        GVAR(mouse) set [_button,true];

        // Detect right click
        if ((_button == 1) && (GVAR(camMode) == 1)) then {
            // In first person toggle sights mode
            GVAR(camGun) = !GVAR(camGun);
            [] call FUNC(transitionCamera);
        };
    };
    case "onmousebuttonup": {
        _args params ["_ctrl","_button"];

        GVAR(mouse) set [_button,false];
        if (_button == 0) then { GVAR(camDolly) = [0,0]; };
    };
    case "onmousezchanged": {
        _args params ["_ctrl","_zChange"];

        // Scroll to change speed, modifier for zoom
        if (GVAR(ctrlKey)) then {
            [nil,nil,nil,nil,nil,nil, GVAR(camZoom) + _zChange * 0.1] call FUNC(setCameraAttributes);
        } else {
            [nil,nil,nil,nil,nil,nil,nil, GVAR(camSpeed) + _zChange * 0.2] call FUNC(setCameraAttributes);
        };
    };
    case "onmousemoving": {
        _args params ["_ctrl","_x","_y"];

        [_x,_y] call FUNC(handleMouse);
    };
    // Keyboard events
    case "onkeydown": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];

        // Handle held keys (prevent repeat calling)
        if (_dik in GVAR(heldKeys)) exitwith {};
        GVAR(heldKeys) pushBack _dik;

        switch (_dik) do {
            case 1: { // Esc
               [player,false] call FUNC(setSpectator); // Handle esc menu goes here, currently closes for purposes of testing
            };
            case 2: { // 1
                [_display,nil,nil,nil,nil,nil,true] call FUNC(toggleInterface);
            };
            case 3: { // 2
                [_display,nil,nil,nil,nil,true] call FUNC(toggleInterface);
            };
            case 4: { // 3
                [_display,true] call FUNC(toggleInterface);
            };
            case 5: { // 4
                GVAR(showIcons) = !GVAR(showIcons);
            };
            case 14: { // Backspace
                [_display,nil,nil,true] call FUNC(toggleInterface);
            };
            case 16: { // Q
                GVAR(camBoom) = 0.5;
            };
            case 17: { // W
                GVAR(camDolly) set [1, GVAR(camSpeed)];
            };
            case 29: { // Ctrl
                GVAR(ctrlKey) = true;
            };
            case 30: { // A
                GVAR(camDolly) set [0, -GVAR(camSpeed)];
            };
            case 31: { // S
                GVAR(camDolly) set [1, -GVAR(camSpeed)];
            };
            case 32: { // D
                GVAR(camDolly) set [0, GVAR(camSpeed)];
            };
            case 35: { // H
                [_display,nil,true] call FUNC(toggleInterface);
            };
            case 44: { // Z
                GVAR(camBoom) = -0.5;
            };
            case 49: { // N
                if (_ctrl) then {
                    [nil,nil,-1] call FUNC(cycleCamera);
                } else {
                    [nil,nil,1] call FUNC(cycleCamera);
                };
            };
            case 50: { // M
                [_display,nil,nil,nil,true] call FUNC(toggleInterface);
            };
            case 57: { // Spacebar
                // Freecam attachment here, if in external then set cam pos and attach
            };
            case 200: { // Up arrow
                [-1] call FUNC(cycleCamera);
            };
            case 203: { // Left arrow
                [nil,1] call FUNC(cycleCamera);
            };
            case 205: { // Right arrow
                [nil,-1] call FUNC(cycleCamera);
            };
            case 208: { // Down arrow
                [1] call FUNC(cycleCamera);
            };
        };

        true
    };
    case "onkeyup": {
        _args params ["_display","_dik","_shift","_ctrl","_alt"];

        // No longer being held
        GVAR(heldKeys) = GVAR(heldKeys) - [_dik];

        switch (_dik) do {
            case 16: { // Q
                GVAR(camBoom) = 0;
            };
            case 17: { // W
                GVAR(camDolly) set [1, 0];
            };
            case 29: { // Ctrl
                GVAR(ctrlKey) = false;
            };
            case 30: { // A
                GVAR(camDolly) set [0, 0];
            };
            case 31: { // S
                GVAR(camDolly) set [1, 0];
            };
            case 32: { // D
                GVAR(camDolly) set [0, 0];
            };
            case 44: { // Z
                GVAR(camBoom) = 0;
            };
        };

        true
    };
    // Tree events
    case "ontreedblclick": {
        // Update camera view when listbox unit is double clicked on
        _args params ["_tree","_sel"];

        // Ensure a unit was selected
        if (count _sel == 3) then {
            private ["_netID","_newUnit","_newMode"];
            _netID = (_args select 0) tvData _sel;
            _newUnit = objectFromNetId _netID;

            // When unit is reselected, toggle camera mode
            if (_newUnit == GVAR(camUnit) || GVAR(camMode) == 0) then {
                _newMode = [2,2,1] select GVAR(camMode);
            };

            [_newMode,_newUnit] call FUNC(transitionCamera);
        };
    };
    case "onunitsupdate": {
        _args params ["_tree"];
        private ["_curSelData","_cachedGrps","_cachedSides","_grp","_side","_sNode","_gNode","_uNode"];

        // Cache current selection
        _curSelData = _tree tvData (tvCurSel _tree);

        // Clear the tree
        tvClear _tree;

        // Update the tree from the unit list
        _cachedGrps = [];
        _cachedSides = [];
        {
            _grp = group _x;
            _side = [side _grp] call BIS_fnc_sideName;

            // Use correct side node
            if !(_side in _cachedSides) then {
                // Add side node
                _sNode = _tree tvAdd [[], _side];

                _cachedSides pushBack _side;
                _cachedSides pushBack _sNode;
            } else {
                // If side already processed, use existing node
                _sNode = _cachedSides select ((_cachedSides find _side) + 1);
            };

            // Use correct group node
            if !(_grp in _cachedGrps) then {
                // Add group node
                _gNode = _tree tvAdd [[_sNode], groupID _grp];

                _cachedGrps pushBack _grp;
                _cachedGrps pushBack _gNode;
            } else {
                // If group already processed, use existing node
                _gNode = _cachedGrps select ((_cachedGrps find _grp) + 1);
            };

            _uNode = _tree tvAdd [[_sNode,_gNode], GETVAR(_x,GVAR(uName),"")];
            _tree tvSetData [[_sNode,_gNode,_uNode], netID _x];

            // Preserve the previous selection
            if (_curSelData == (_tree tvData [_sNode,_gNode,_uNode])) then {
                _tree tvSetCurSel [_sNode,_gNode,_uNode];
            };

            _tree tvSort [[_sNode,_gNode],false];
            _tree tvExpand [_sNode,_gNode];
        } forEach GVAR(unitList);

        {
            if (typeName _x == "SCALAR") then {
                _tree tvSort [[_x],false];
                _tree tvExpand [_x];
            };
        } forEach _cachedSides;

        _tree tvSort [[],false];
    };
    // Map events
    case "onmapdblclick": {
        _args params ["_map","_button","_x","_y","_shift","_ctrl"];
        private ["_newPos","_oldZ"];

        if ((GVAR(camMode) == 0) && (_button == 0) && _ctrl) then {
            _newPos = _map ctrlMapScreenToWorld [_x,_y];
            _oldZ = (ASLtoATL GVAR(camPos)) select 2;
            _newPos set [2, _oldZ];
            [nil,nil,nil, _newPos] call FUNC(setCameraAttributes);
        };
    };
    case "ondraw": {
        _args params ["_map"];

        if (GVAR(camMode) == 0) then {
            _map drawIcon ["\A3\UI_F\Data\GUI\Rsc\RscDisplayMissionEditor\iconcamera_ca.paa",[0,0,0,1],GVAR(camera),24,24,GVAR(camPan)];
        };

        if !(GVAR(showIcons)) exitWith {};

        private ["_cachedVehicles","_unit","_color","_icon"];
        _cachedVehicles = [];
        {
            _unit = vehicle _x;

            if !(_unit in _cachedVehicles) then {
                _cachedVehicles pushBack _unit;

                // Use previously cached info where possible
                if (isNil { GETVAR(_unit,GVAR(uIcon),nil) }) then {
                    [_unit] call FUNC(cacheUnitInfo);
                };

                _color = GETVAR(_unit,GVAR(uColor),[ARR_4(0,0,0,0)]);
                _icon = GETVAR(_unit,GVAR(uIcon),"");
                _map drawIcon [_icon, _color, _unit, 24, 24, getDir _unit];
            };
        } forEach GVAR(unitList);
    };
};
