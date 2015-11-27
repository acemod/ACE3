// by commy2 and esteldunedain
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};

GVAR(showNamesTime) = -10;

// Add keybinds
["ACE3 Common", QGVAR(showNameTags), localize LSTRING(ShowNames),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    GVAR(showNamesTime) = ACE_time;
    if (call FUNC(canShow)) then{ call FUNC(doShow); };
    // Return false so it doesn't block other actions
    false
},
{false},
[29, [false, false, false]], false] call cba_fnc_addKeybind; //LeftControl Key

// Wait until the colors are defined before starting to draw the nametags
["SettingsInitialized", {
    // Draw handle
    call FUNC(updateSettings);
}] call EFUNC(common,addEventHandler);

// Change settings accordingly when they are changed
["SettingChanged", {
    params ["_name"];
    if (_name == QGVAR(showPlayerNames)) then {
        call FUNC(updateSettings);
    };
}] call EFUNC(common,addEventHandler);
