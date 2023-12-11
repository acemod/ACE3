#include "script_component.hpp"
#include "\z\ace\addons\arsenal\defines.hpp"
/*
 * Author: commy2
 *
 * Public: No
*/

params ["_display"];

// Change the abort button to a return button
private _ctrlButtonAbort = _display displayCtrl 104;
_ctrlButtonAbort ctrlSetText LLSTRING(Mission);
_ctrlButtonAbort ctrlSetTooltip LLSTRING(ReturnToArsenal);

_ctrlButtonAbort ctrlSetEventHandler ["ButtonClick", {
    // Don't open arsenal unless it's the player, on foot
    if (player == call CBA_fnc_currentUnit && {isNull objectParent player}) then {
        params ["_control"];

        // Close pause menu
        (ctrlParent _control) closeDisplay IDC_CANCEL;

        // Open the arsenal again
        {
            [player, player, true] call FUNC(openBox);
        } call CBA_fnc_execNextFrame;
    };

    true
} call EFUNC(common,codeToString)];

true
