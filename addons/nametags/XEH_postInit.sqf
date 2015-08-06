// by commy2 and esteldunedain
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};

GVAR(showNamesTime) = -10;

// Add keybinds
[localize ELSTRING(common,ACEConfigCategoryCommon)
, QGVAR(showNameTags), localize LSTRING(ShowNames),
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

// Monitor the assigned teams, and propegate them appropriately for the player
// This allows for assigned team colors to match across the entire group
[{
    private["_leader", "_playerIsLeader", "_unitTeam"];
    if (!(isNull ACE_player) && { alive ACE_player } ) then {
        _leader = leader (group ACE_player);
        _playerIsLeader = false;
        
        if(alive _leader) then {
            if(_leader == ACE_player) then {
                _playerIsLeader = true;
            };
        };
        
        if (_playerIsLeader) then {
            {
                if(alive _x) then {
                    _unitTeam = _x getVariable [QGVAR(teamAssignment),"MAIN"];
                    if (_unitTeam != assignedTeam _x) then {
                        _x setVariable [QGVAR(teamAssignment), assignedTeam _x,true];
                    };
                };
            } forEach units (group ACE_player);
        } else {
            {
                if(alive _x) then {
                    _unitTeam = _x getVariable [QGVAR(teamAssignment),"MAIN"];
                    if (_unitTeam != assignedTeam _x) then {
                        _x assignTeam _unitTeam;
                    };
                };
            } forEach units (group ACE_player);
        };
    };
}, 5, []] call CBA_fnc_addPerFrameHandler;

// Wait until the colors are defined before starting to draw the nametags
["SettingsInitialized", {
    // Draw handle
    call FUNC(updateSettings);
}] call EFUNC(common,addEventHandler);

// Change settings accordingly when they are changed
["SettingChanged", {
    PARAMS_1(_name);
    if (_name  == QGVAR(showPlayerNames)) then {
        call FUNC(updateSettings);
    };
}] call EFUNC(common,addEventHandler);
