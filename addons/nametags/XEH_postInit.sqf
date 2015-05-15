// by commy2 and esteldunedain
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};

GVAR(ShowNamesTime) = -10;

// Add keybinds
["ACE3 Common", QGVAR(showNameTags), localize "STR_ACE_NameTags_ShowNames",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    GVAR(ShowNamesTime) = time;
    if (call FUNC(canShow)) then{ call FUNC(doShow); };
    // Return false so it doesn't block other actions
    false
},
{false},
[29, [false, false, false]], false] call cba_fnc_addKeybind; //LeftControl Key


// Draw handle on start if set
if (GVAR(showPlayerNames) > 0) then {
    GVAR(drawHandler) = addMissionEventHandler ["Draw3D", {_this call FUNC(onDraw3d);}];
};

// Set the EH which waits for a setting to be changed, so that the effect is shown immediately
if (!GVAR(showPlayerNamesForce)) then {
    ["SettingChanged", {
        PARAMS_2(_name,_value)
        if (_name  == QGVAR(showPlayerNames)) then {
            if ((GVAR(showPlayerNames) > 0) && (_value == 0)) then {
                removeMissionEventHandler ["Draw3D", GVAR(drawHandler)];
                GVAR(drawHandler) = nil;
            };
            if ((GVAR(showPlayerNames) == 0) && (_value > 0)) then {
                GVAR(drawHandler) = addMissionEventHandler ["Draw3D", {_this call FUNC(onDraw3d);}];
            };
        };
    }] call ace_common_fnc_addEventHandler;
};