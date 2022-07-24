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
    GVAR(showNamesTime) = CBA_missionTime;
    // if (call FUNC(canShow)) then{ call FUNC(doShow); }; // This code doesn't work (canShow has a nil / has never worked??)
    // Return false so it doesn't block other actions
    false
},
{false},
[29, [false, false, false]], false] call CBA_fnc_addKeybind; //LeftControl Key

// Wait until the colors are defined before starting to draw the nametags
["CBA_settingsInitialized", {
    // Draw handle
    call FUNC(updateSettings);
}] call CBA_fnc_addEventHandler;

// Change settings accordingly when they are changed
["CBA_SettingChanged", {
    params ["_name"];
    if (_name == QGVAR(showPlayerNames)) then {
        call FUNC(updateSettings);
    };
    // Reset nametag flag cache on setting change:
    ACE_player setVariable [QGVAR(flagsCache), nil];
}] call CBA_fnc_addEventHandler;

["cba_events_visionModeEvent", {
    // Reset nametag flag cache on vision mode change:
    ACE_player setVariable [QGVAR(flagsCache), nil];
}] call CBA_fnc_addEventHandler;

// civilians don't use military ranks
["CIV_F", ["","","","","","",""]] call FUNC(setFactionRankIcons);

// Change ranks based on faction for all factions that have an entry in CfgFactionClasses
if (missionNamespace getVariable [QGVAR(useFactionIcons), true]) then {
    {
        if (isArray (_x >> QGVAR(rankIcons))) then {
            private _faction = configName _x;
            if (!isNil {GVAR(factionRanks) getVariable _faction}) exitWith {}; // don't overwrite if already set
            private _icons = getArray (_x >> QGVAR(rankIcons));
            [_faction, _icons] call FUNC(setFactionRankIcons);
        };
    } forEach ("true" configClasses (configFile >> "CfgFactionClasses"));
};
