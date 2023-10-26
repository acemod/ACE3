#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: johnb43, Grim
 * Gets list of virtual items available to the object.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Virtual Items <HASHMAP>
 *
 * Example:
 * cursorObject call ace_arsenal_fnc_getVirtualItems
 *
 * Public: Yes
*/
params [["_object", objNull, [objNull]]];

private _virtualItems = _object getVariable QGVAR(virtualItems);
if (isNil "_virtualItems") exitWith {createHashMap};

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

_virtualItemsFlat // return
