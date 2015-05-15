// by commy2 and esteldunedain
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};

GVAR(showNamesTime) = -10;

// Add keybinds
["ACE3 Common", QGVAR(showNameTags), localize "STR_ACE_NameTags_ShowNames",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    GVAR(showNamesTime) = time;
    if (call FUNC(canShow)) then{ call FUNC(doShow); };
    // Return false so it doesn't block other actions
    false
},
{false},
[29, [false, false, false]], false] call cba_fnc_addKeybind; //LeftControl Key


// Draw handle
call FUNC(updateSettings);

// Change settings accordingly when they are changed
["SettingChanged", {
    PARAMS_1(_name);
    if (_name  == QGVAR(showPlayerNames)) then {
        call FUNC(updateSettings);
    };
}] call EFUNC(common,addEventHandler);
