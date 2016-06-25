// by commy2 and esteldunedain
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};

["OPF_F", [
    QPATHTOF(UI\icons_russia\private_gs.paa),
    QPATHTOF(UI\icons_russia\corporal_gs.paa),
    QPATHTOF(UI\icons_russia\sergeant_gs.paa),
    QPATHTOF(UI\icons_russia\lieutenant_gs.paa),
    QPATHTOF(UI\icons_russia\captain_gs.paa),
    QPATHTOF(UI\icons_russia\major_gs.paa),
    QPATHTOF(UI\icons_russia\colonel_gs.paa)
]] call FUNC(setFactionRankIcons);

GVAR(showNamesTime) = -10;

// Add keybinds
["ACE3 Common", QGVAR(showNameTags), localize LSTRING(ShowNames),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    GVAR(showNamesTime) = CBA_missionTime;
    if (call FUNC(canShow)) then{ call FUNC(doShow); };
    // Return false so it doesn't block other actions
    false
},
{false},
[29, [false, false, false]], false] call CBA_fnc_addKeybind; //LeftControl Key

// Wait until the colors are defined before starting to draw the nametags
["ace_settingsInitialized", {
    // Draw handle
    call FUNC(updateSettings);
}] call CBA_fnc_addEventHandler;

// Change settings accordingly when they are changed
["ace_settingChanged", {
    params ["_name"];
    if (_name == QGVAR(showPlayerNames)) then {
        call FUNC(updateSettings);
    };
}] call CBA_fnc_addEventHandler;
