// by commy2 and esteldunedain
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};

GVAR(showNamesTime) = -10;

// Add keybinds
["ACE3 Common", QGVAR(showNameTags), localize LSTRING(ShowNames), {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    GVAR(showNamesTime) = ACE_time;
    if (call FUNC(canShow)) then{ call FUNC(doShow); };
    // Return false so it doesn't block other actions
    false
}, {false}, [29, [false, false, false]], false] call CBA_fnc_addKeybind; //LeftControl Key

call FUNC(updateSettings);

// Change settings accordingly when they are changed
["CBA_SettingChanged", {
    params ["_setting"];

    if (_setting == QGVAR(showPlayerNames)) then {
        call FUNC(updateSettings);
    };
}] call CBA_fnc_addEventHandler;
