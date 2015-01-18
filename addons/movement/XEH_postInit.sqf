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
