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
    if (!GVAR(inHand)) exitWith {false};

    // Statement
    GVAR(dropMode) = [true, false] select GVAR(dropMode);
    GVAR(throwType) = "normal"; // Reset for consistency when opening
    call FUNC(updateControlsHint); // Change controls hint for MMB
    true
}, {false}, [34, [false, true, false]], false] call CBA_fnc_addKeybind; // Ctrl + G

["ACE3 Weapons", QGVAR(dropModeHold), localize LSTRING(DropModeHold), {
    // Condition
    if (!GVAR(inHand)) exitWith {false};

    // Statement
    GVAR(dropMode) = true;
    GVAR(throwType) = "normal"; // Reset for consistency when opening
    call FUNC(updateControlsHint); // Change controls hint for MMB
    true
}, {
    // Condition
    if (!GVAR(inHand)) exitWith {false};

    // Statement
    GVAR(dropMode) = false;
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

    if (GVAR(inHand)) then {
        [ACE_player, "Interact menu opened"] call FUNC(exitThrowMode);
    } else {
        // Show pick up actions on CfgAmmo's
        if (GVAR(enablePickUp)) then {
            _this call FUNC(interactEH);
        };
    };
}] call EFUNC(common,addEventHandler);


// Fired XEH
[QGVAR(throwFiredXEH), {_this call FUNC(throwFiredXEH)}] call EFUNC(common,addEventHandler);


// Display handlers
["KeyDown", {_this call FUNC(onKeyDown)}] call CBA_fnc_addDisplayHandler;
["MouseButtonDown", {_this call FUNC(onMouseButtonDown)}] call CBA_fnc_addDisplayHandler;
["MouseZChanged", {_this call FUNC(onMouseScroll)}] call CBA_fnc_addDisplayHandler;
