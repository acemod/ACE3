#include "script_component.hpp"

if (underwater player) exitWith { false };
if (!([player] call cse_fnc_canInteract) || {!([player, "cse_ab_Kestrel4500"] call cse_fnc_hasItem_CC)}) exitwith {false};

cse_ab_Kestrel4500_Overlay = false;
3 cutText ["", "PLAIN"];

cse_ab_Kestrel4500 = true;
createDialog 'cse_ab_Kestrel4500_Display';
[] spawn cse_ab_Kestrel4500_fnc_kestrel_mainLoop;

true
