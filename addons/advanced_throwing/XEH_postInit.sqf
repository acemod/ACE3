#include "script_component.hpp"

// Fired XEH
GVAR(ammoEventHandlers) = createHashMap;
[QGVAR(throwFiredXEH), LINKFUNC(throwFiredXEH)] call CBA_fnc_addEventHandler;

// Exit on HC
if (!hasInterface) exitWith {};

// Temporary Wind Info indication
GVAR(tempWindInfo) = false;

// Add keybinds
["ACE3 Weapons", QGVAR(prepare), localize LSTRING(Prepare), {
    // Condition
    if !([ACE_player] call FUNC(canPrepare)) exitWith {false};
    if (EGVAR(common,isReloading)) exitWith {true};

    // Statement
    [ACE_player] call FUNC(prepare);

    true
}, {false}, [34, [true, false, false]], false] call CBA_fnc_addKeybind; // Shift + G

["ACE3 Weapons", QGVAR(dropModeToggle), localize LSTRING(DropModeToggle), {
    // Condition
    if (!(ACE_player getVariable [QGVAR(inHand), false]) || {underwater ACE_player}) exitWith {false};

    // Statement
    private _currentDropMode = ACE_player getVariable [QGVAR(dropMode), false];
    ACE_player setVariable [QGVAR(dropMode), !_currentDropMode];

    ACE_player setVariable [QGVAR(throwType), THROW_TYPE_DEFAULT]; // Reset for consistency when opening
    call FUNC(updateControlsHint); // Change controls hint for MMB
    true
}, {false}, [34, [false, true, false]], false] call CBA_fnc_addKeybind; // Ctrl + G

["ACE3 Weapons", QGVAR(dropModeHold), localize LSTRING(DropModeHold), {
    // Condition
    if !(ACE_player getVariable [QGVAR(inHand), false]) exitWith {false};

    // Statement
    ACE_player setVariable [QGVAR(dropMode), true];
    ACE_player setVariable [QGVAR(throwType), THROW_TYPE_DEFAULT]; // Reset for consistency when opening
    call FUNC(updateControlsHint); // Change controls hint for MMB
    true
}, {
    // Condition
    if !(ACE_player getVariable [QGVAR(inHand), false]) exitWith {false};

    // Statement
    ACE_player setVariable [QGVAR(dropMode), false];
    call FUNC(updateControlsHint); // Change controls hint for MMB
    true
}, [0, [false, false, false]], false] call CBA_fnc_addKeybind; // Empty


// Event handlers
["unit", {
    [_this select 1, "Player changed"] call FUNC(exitThrowMode);
}] call CBA_fnc_addPlayerEventhandler;

["visibleMap", {
    params ["", "_visibleMap"]; // command visibleMap is updated one frame later
    if (_visibleMap && {ACE_player getVariable [QGVAR(inHand), false]}) then {
        [ACE_player, "Opened Map"] call FUNC(exitThrowMode);
    };
}] call CBA_fnc_addPlayerEventhandler;


["ace_interactMenuOpened", {
    // Exit if advanced throwing is disabled (pick up only supports advanced throwing)
    if (!GVAR(enabled)) exitWith {};

    if (ACE_player getVariable [QGVAR(inHand), false]) then {
        [ACE_player, "Interact menu opened"] call FUNC(exitThrowMode);
    } else {
        params ["_interactionType"];
        // Ignore self-interaction menu, when in vehicle and when pick up is disabled
        if (GVAR(enablePickUp) && {_interactionType == 0} && {vehicle ACE_player == ACE_player}) then {
            // Show pick up actions on CfgAmmo's
            call FUNC(renderPickUpInteraction);
        };
    };
}] call CBA_fnc_addEventHandler;


// Set last thrown time on Vanilla Throwing and Advanced Throwing
["ace_firedPlayer", {
    //IGNORE_PRIVATE_WARNING ["_unit", "_weapon"];
    if (_weapon == "Throw") then {
        _unit setVariable [QGVAR(lastThrownTime), CBA_missionTime];
    };
}] call CBA_fnc_addEventHandler;


// Display handlers
["KeyDown", {_this call FUNC(onKeyDown)}] call CBA_fnc_addDisplayHandler;
["MouseButtonDown", {_this call FUNC(onMouseButtonDown)}] call CBA_fnc_addDisplayHandler;
["MouseZChanged", {_this call FUNC(onMouseScroll)}] call CBA_fnc_addDisplayHandler;


#ifdef DRAW_THROW_PATH
GVAR(predictedPath) = [];
GVAR(flightPath) = [];

addMissionEventHandler ["Draw3D", { // Blue is predicted before throw, red is real
    {
        _x params ["", "_newTrajAGL"];
        drawIcon3D ["\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa", [0,0,1,1], _newTrajAGL, 1, 1, 0, "", 2];
    } forEach GVAR(predictedPath);
    {
        _x params ["_pos", "_vectorUp"];
        drawIcon3D ["\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa", [1,0,0,1], _pos, 1, 1, 0, "", 2];
        drawLine3D [_pos, _pos vectorAdd _vectorUp, [1,0,1,1]];
    } forEach GVAR(flightPath);
}];
#endif
