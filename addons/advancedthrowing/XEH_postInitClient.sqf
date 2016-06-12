#include "script_component.hpp"

// Exit on HC
if (!hasInterface) exitWith {};


// Add keybinds
["ACE3 Weapons", QGVAR(prepare), localize LSTRING(Prepare), {
    // Condition
    if (!([ACE_player] call FUNC(canPrepare))) exitWith {false};

    // Statement
    [ACE_player] call FUNC(prepare);

    true
}, {false}, [34, [true, false, false]], false] call CBA_fnc_addKeybind; // Shift + G

["ACE3 Weapons", QGVAR(dropModeToggle), localize LSTRING(DropModeToggle), {
    // Condition
    if !(ACE_player getVariable [QGVAR(inHand), false]) exitWith {false};

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
["playerChanged", {
    [_this select 1, "Player changed"] call FUNC(exitThrowMode);
}] call EFUNC(common,addEventhandler);

["interactMenuOpened", {
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
}] call EFUNC(common,addEventHandler);


// Fired XEH
[QGVAR(throwFiredXEH), FUNC(throwFiredXEH)] call CBA_fnc_addEventHandler;


// Display handlers
["KeyDown", {_this call FUNC(onKeyDown)}] call CBA_fnc_addDisplayHandler;
["MouseButtonDown", {_this call FUNC(onMouseButtonDown)}] call CBA_fnc_addDisplayHandler;
["MouseZChanged", {_this call FUNC(onMouseScroll)}] call CBA_fnc_addDisplayHandler;
