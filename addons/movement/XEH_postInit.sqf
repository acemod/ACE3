//by commy2
#include "script_component.hpp"

["inventoryDisplayLoaded", {

    [{
        private "_dialog";

        _dialog = _this select 0;

        if (isNull _dialog) exitWith {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        _dialog displayCtrl 111 ctrlSetText format ["%1 - %2 %3", [ACE_player] call EFUNC(common,getName), localize "STR_ACE_Movement_Weight", [ACE_player] call FUNC(getWeight)];

    }, 0, _this select 0] call CBA_fnc_addPerFrameHandler;

}] call EFUNC(common,addEventHandler);

["ACE3",
    localize "STR_ACE_Movement_Climb",
    {
        // Conditions: canInteract
        _exceptions = [];
        if !(_exceptions call EGVAR(common,canInteract)) exitWith {false};
        // Conditions: specific
        if (ACE_player != (vehicle ACE_player)) exitWith {false};

        // Statement
        [ACE_player] call FUNC(climb);
        true
    },
    [47, [false, true, false]], //DIK_V + CTRL//STRG
    false,
    "keydown"
] call cba_fnc_registerKeybind;
