#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Open arsenal.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Unit to open the arsenal on <OBJECT>
 * 2: Ignore virtual items and fill arsenal <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, player] call ace_arsenal_fnc_openBox
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_center", objNull, [objNull]], ["_mode", false, [false]]];

if (
    isNull _object ||
    {isNull _center} ||
    {!(_center isKindOf "CAManBase")} ||
    {!(isNull objectParent _center) && {!is3DEN}}
) exitWith {};

// If object has no arsenal and chosen option is to not ignore virtual items of object, exit
if (isNil {_object getVariable QGVAR(virtualItems)} && {!_mode}) exitWith {
    [LLSTRING(noVirtualItems), false, 5, 1] call EFUNC(common,displayText);
};

// Don't execute in scheduled environment
if (canSuspend) exitWith {
    [{_this call FUNC(openBox)}, _this] call CBA_fnc_directCall;
};

private _displayToUse = findDisplay IDD_RSCDISPLAYCURATOR;
_displayToUse = [_displayToUse, findDisplay IDD_MISSION] select (isNull _displayToUse);
_displayToUse = [_displayToUse, findDisplay IDD_DISPLAY3DEN] select is3DEN;

// Check if the display is available and that there isn't already a camera for the arsenal
if (isNull _displayToUse || {!isNil QGVAR(camera)}) exitWith {
    [LLSTRING(CantOpenDisplay), false, 5, 1] call EFUNC(common,displayText);
};

GVAR(currentBox) = _object;

if (_mode) then {
    // Add all the items from the game that the arsenal has detected
    GVAR(virtualItems) = +(uiNamespace getVariable QGVAR(configItems));
    GVAR(virtualItemsFlat) = +(uiNamespace getVariable QGVAR(configItemsFlat));
} else {
    // Add only specified items to the arsenal
    private _virtualItems = _object getVariable QGVAR(virtualItems);

    GVAR(virtualItems) = if (isNil "_virtualItems") then {
        _virtualItems = [
            [IDX_VIRT_WEAPONS, createHashMapFromArray [[IDX_VIRT_PRIMARY_WEAPONS, createHashMap], [IDX_VIRT_SECONDARY_WEAPONS, createHashMap], [IDX_VIRT_HANDGUN_WEAPONS, createHashMap]]],
            [IDX_VIRT_ATTACHMENTS, createHashMapFromArray [[IDX_VIRT_OPTICS_ATTACHMENTS, createHashMap], [IDX_VIRT_FLASHLIGHT_ATTACHMENTS, createHashMap], [IDX_VIRT_MUZZLE_ATTACHMENTS, createHashMap], [IDX_VIRT_BIPOD_ATTACHMENTS, createHashMap]]]
        ];

        _virtualItems = createHashMapFromArray _virtualItems;

        for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
            _virtualItems set [_index, createHashMap];
        };
    } else {
        +_virtualItems
    };

    // Flatten out hashmaps for easy checking later
    private _virtualItemsFlat = +_virtualItems;
    private _weapons = _virtualItemsFlat deleteAt IDX_VIRT_WEAPONS;
    private _attachments = _virtualItemsFlat deleteAt IDX_VIRT_ATTACHMENTS;

    for "_index" from IDX_VIRT_ITEMS_ALL to IDX_VIRT_MISC_ITEMS do {
        _virtualItemsFlat merge [_virtualItemsFlat deleteAt _index, true];
    };

    for "_index" from IDX_VIRT_PRIMARY_WEAPONS to IDX_VIRT_HANDGUN_WEAPONS do {
        _virtualItemsFlat merge [_weapons deleteAt _index, true];
    };

    for "_index" from IDX_VIRT_OPTICS_ATTACHMENTS to IDX_VIRT_BIPOD_ATTACHMENTS do {
        _virtualItemsFlat merge [_attachments deleteAt _index, true];
    };

    GVAR(virtualItemsFlat) = _virtualItemsFlat;
};

GVAR(center) = _center;

if (is3DEN) then {
    _displayToUse createDisplay QGVAR(display);
} else {
    [{
        _this createDisplay QGVAR(display);
    }, _displayToUse] call CBA_fnc_execNextFrame;
};
