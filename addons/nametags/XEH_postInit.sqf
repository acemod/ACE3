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
    // Reset nametag flag cache on setting change:
    ACE_player setVariable [QGVAR(flagsCache), nil];
}] call CBA_fnc_addEventHandler;

["cba_events_visionModeEvent", {
    // Reset nametag flag cache on vision mode change:
    ACE_player setVariable [QGVAR(flagsCache), nil];
}] call CBA_fnc_addEventHandler;

// civilians don't use military ranks
["CIV_F", ["","","","","","",""]] call FUNC(setFactionRankIcons);

//Change ranks based on faction for all factions that have an entry in CfgFactionClasses
{
    private _pathArray = (str _x) splitString "\/";
    private _faction = _pathArray select (count _pathArray - 1);
    
    private _private = if (isText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_private")) then {
        getText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_private");
    } else {"\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa"};
    private _corporal = if (isText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_corporal")) then {
        getText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_corporal");
    } else {"\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa"};
    private _sergeant = if (isText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_sergeant")) then {
        getText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_sergeant");
    } else {"\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa"};
    private _lieutenant = if (isText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_lieutenant")) then {
        getText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_lieutenant");
    } else {"\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"};
    private _captain = if (isText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_captain")) then {
        getText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_captain");
    } else {"\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa"};
    private _major = if (isText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_major")) then {
        getText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_major");
    } else {"\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa"};
    private _colonel = if (isText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_colonel")) then {
        getText (configFile >> "CfgFactionClasses" >> _faction >> "ace_nametags_colonel");
    } else {"\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa"};
    
    [_faction, [_private, _corporal, _sergeant, _lieutenant, _captain, _major, _colonel]] call FUNC(setFactionRankIcons);
} forEach ("true" configClasses (configFile >> "CfgFactionClasses"));