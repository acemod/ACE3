#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: johnb43, Grim
 * Updates flattened list of virtual items for checking
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
*/

private _virtualItemsFlat = +GVAR(virtualItems);
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
