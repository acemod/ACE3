// by commy2 and esteldunedain
#include "script_component.hpp"

if (GVAR(showPlayerNames) > 0) then {
    [] call FUNC(initIsSpeaking);
};

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


// Draw handle
if (GVAR(showPlayerNames) > 0 || GVAR(showVehicleCrewInfo)) then {
    addMissionEventHandler ["Draw3D", {_this call FUNC(onDraw3d);}];
};
