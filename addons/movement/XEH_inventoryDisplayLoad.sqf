#include "script_component.hpp"

disableSerialization;

[{
    disableSerialization;
    params ["_dialog"];

    if (isNull _dialog) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    (_dialog displayCtrl 111) ctrlSetText format ["%1 - %2 %3", [ACE_player, false, true] call EFUNC(common,getName), localize LSTRING(Weight), [ACE_player] call FUNC(getWeight)];
}, 0, _this select 0] call CBA_fnc_addPerFrameHandler;
