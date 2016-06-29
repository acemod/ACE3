#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(lastFPTime) = -1;
GVAR(fingersHash) = HASH_CREATE;
GVAR(pfeh_id) = -1;

//Add Keybind:
["ACE3 Common", QGVAR(finger), [(localize LSTRING(keyComb)), (localize LSTRING(keyComb_description))], {
    if (!GVAR(enabled)) exitWith {false};
    _this call FUNC(keyPress);
}, {false}, [41, [true, false, false]], true] call CBA_fnc_addKeybind; // Shift + Tilda (hold)
