#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Clear the current container.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display"];

// Clear chosen container, reset currentItems for that container and get relevant container
private _container = switch (GVAR(currentLeftPanel)) do {
    // Uniform
    case IDC_buttonUniform: {
        {
            GVAR(center) removeItemFromUniform _x;
        } forEach (vestItems GVAR(center));

        GVAR(currentItems) set [IDX_CURR_UNIFORM_ITEMS, []];

        uniformContainer GVAR(center)
    };
    // Vest
    case IDC_buttonVest: {
        {
            GVAR(center) removeItemFromVest _x;
        } forEach (vestItems GVAR(center));

        GVAR(currentItems) set [IDX_CURR_VEST_ITEMS, []];

        vestContainer GVAR(center)
    };
    // Backpack
    case IDC_buttonBackpack: {
        clearAllItemsFromBackpack GVAR(center);

        GVAR(currentItems) set [IDX_CURR_BACKPACK_ITEMS, []];

        backpackContainer GVAR(center)
    };
};

// Clear number of owned items
private _ctrlList = _display displayCtrl IDC_rightTabContentListnBox;

for "_lbIndex" from 0 to (lbSize _ctrlList) - 1 do {
    _ctrlList lnbSetText [[_lbIndex, 2], "0"];
};

// Update load bar
(_display displayCtrl IDC_loadIndicatorBar) progressSetPosition 0;

// Refresh availibility of items based on space remaining in container
[_ctrlList, _container, false] call FUNC(updateRightPanel);
