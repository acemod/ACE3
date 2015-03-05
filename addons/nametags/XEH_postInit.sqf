// by commy2 and CAA-Picard
#include "script_component.hpp"

[] call FUNC(initIsSpeaking);

if (!hasInterface) exitWith {};


// Add keybinds
["ACE3", QGVAR(showNameTags), localize "STR_ACE_NameTags_ShowNames",
{
    // Conditions: canInteract
    _exceptions = [];
    if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};

    // Statement
    GVAR(ShowNamesTime) = time;
    if (call FUNC(canShow)) then{ call FUNC(doShow); };
    // Return false so it doesn't block other actions
    false
},
{},
[29, [false, false, false]], false] call cba_fnc_addKeybind; //LeftControl Key


// Draw handle
addMissionEventHandler ["Draw3D", {_this call FUNC(onDraw3d);}];
