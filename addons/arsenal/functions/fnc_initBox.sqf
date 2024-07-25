#include "..\script_component.hpp"
/*
 * Author: Alganthe, johnb43
 * Initialize a box / object for arsenal.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <BOOL> <ARRAY>
 * 2: Initialize globally <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["MyItem1", "MyItem2", "MyItemN"]] call ace_arsenal_fnc_initBox
 * [_box, true] call ace_arsenal_fnc_initBox
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_items", true, [[], true]], ["_global", true, [true]]];

if (isNull _object) exitWith {};

if (_global && {isMultiplayer} && {isNil {_object getVariable QGVAR(initBoxJIP)}}) then {
    private _id = [QGVAR(initBox), [_object, _items, false]] call CBA_fnc_globalEventJIP;

    // Remove JIP EH if object is deleted
    [_id, _object] call CBA_fnc_removeGlobalEventJIP;

    // Save JIP ID
    _object setVariable [QGVAR(initBoxJIP), _id, true];
} else {
    // Only add interaction if there isn't one already present
    if (((_object getVariable [QEGVAR(interact_menu,actions), []]) findIf {((_x select 0) select 0) == QGVAR(interaction)}) != -1) exitWith {};

    private _action = [
        QGVAR(interaction),
        localize "STR_A3_Arsenal",
        "",
        {
            params ["_target", "_player"];

            [_target, _player] call FUNC(openBox);
        },
        {
            params ["_target", "_player"];

            [_player, _target] call EFUNC(common,canInteractWith)
        }
    ] call EFUNC(interact_menu,createAction);
    [_object, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToObject);

    // If items were set globally, do not add items locally
    if (isNil {_object getVariable QGVAR(virtualItems)}) then {
        [_object, _items, false] call FUNC(addVirtualItems);
    };

    [QGVAR(boxInitialized), [_object, _items]] call CBA_fnc_localEvent;
};
