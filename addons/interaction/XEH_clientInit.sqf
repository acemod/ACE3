// by commy2 and CAA-Picard

#include "script_component.hpp"

ACE_Modifier = 0;

if (!hasInterface) exitWith {};

GVAR(isOpeningDoor) = false;

// restore global fire teams for JIP
{
    _team = _x getVariable [QGVAR(assignedFireTeam), ""];
    if (_team != "") then {_x assignTeam _team};
} forEach allUnits;


// Add keybinds
["ACE3", QGVAR(openDoor), localize "STR_ACE_Interaction_OpenDoor",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(!GVAR(isOpeningDoor) &&
    {[2] call FUNC(getDoor) select 1 != ''}
    ) exitWith {false};

    // Statement
    call EFUNC(interaction,openDoor);
    true
},
{},
[57, [false, true, false]], false] call cba_fnc_addKeybind;

["ACE3",
localize "STR_ACE_Interaction_OpenDoor",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !(GVAR(isOpeningDoor)) exitWith {false};

    // Statement
    GVAR(isOpeningDoor) = false;
    true
},
[57, [false, true, false]],
false,
"keyup"
] call cba_fnc_registerKeybind;

["ACE3",
localize "STR_ACE_Interaction_TapShoulder",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
    // Conditions: specific
    if !([ACE_player, cursorTarget] call FUNC(canTapShoulder)) exitWith {false};

    // Statement
    [ACE_player, cursorTarget] call FUNC(tapShoulder);
    true
},
[20, [true, false, false]],
false,
"keydown"
] call cba_fnc_registerKeybind;

["ACE3",
localize "STR_ACE_Interaction_ModifierKey",
{
    // Conditions: canInteract
    _exceptions = ["ACE_Drag_isNotDragging"];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

    // Statement
    ACE_Modifier = 1;
    // Return false so it doesn't block other actions
    false
},
[29, [false, false, false]],
false,
"keydown"
] call cba_fnc_registerKeybind;

["ACE3",
localize "STR_ACE_Interaction_ModifierKey",
{
    // Conditions: canInteract
    _exceptions = ["ACE_Drag_isNotDragging"];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

    // Statement
    ACE_Modifier = 0;
    // Return false so it doesn't block other actions
    false
},
[29, [false, false, false]],
false,
"keyup"
] call cba_fnc_registerKeybind;
