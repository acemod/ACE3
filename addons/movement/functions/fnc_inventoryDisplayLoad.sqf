/*
 * Author: commy2
 * Executed every time an inventory display is opened.
 *
 * Arguments:
 * 0: Inventory display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ACE_movement_fnc_inventoryDisplayLoad
 *
 * Public: No
 */
 #include "script_component.hpp"

disableSerialization;

[{
    disableSerialization;
    params ["_dialog"];

    if (isNull _dialog) exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    (_dialog displayCtrl 111) ctrlSetText format ["%1 - %2 %3", [ACE_player, false, true] call EFUNC(common,getName), localize ELSTRING(common,Weight), [ACE_player] call EFUNC(common,getWeight)];
}, 0, _this select 0] call CBA_fnc_addPerFrameHandler;
