#include "script_component.hpp"

GVAR(WindInfo) = false;
["ACE3 Common", QGVAR(WindInfoKey), localize LSTRING(WindInfoKeyToggle),
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayWindInfo);
},
{false},
[37, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // (SHIFT + K)

["ACE3 Common", QGVAR(WindInfoKey_hold), localize LSTRING(WindInfoKeyHold),
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayWindInfo);
},
{
    GVAR(WindInfo) = false;
    (["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN", 2];
},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)
