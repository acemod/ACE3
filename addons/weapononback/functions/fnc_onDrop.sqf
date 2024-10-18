#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles dropping a weapon onto the secondary slot.
 *
 * Arguments:
 * 0: Drop catcher control <CONTROL>
 * 1: Ignored
 * 2: Ignored
 * 3: Control that the dragging operation started from <CONTROL>
 * 4: Information about the dragged item <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_dropCatcher", "", "", "_originIDC", "_info"];

private _weaponsItems = [];

if (_originIDC == IDC_PRIMARY_SLOT) then {
    [] call FUNC(swap);
} else {
    _info#0 params ["_displayName", "_index"];

    private _display = ctrlParent _dropCatcher;
    private _listBox = _display displayCtrl _originIDC;

    // First index is 127, followed by 1.
    // Of course, the 128th item is then index -1, followed by 128.
    // Thanks BI!
    if (_index == 127) then {
        _index = 0;
    };
    if (_index == -1) then {
        _index = 127;
    };

    private _weaponIndex = -1;
    for "_i" from 0 to _index do {
        if (_listBox lbText _i == _displayName) then {
            _weaponIndex = _weaponIndex + 1;
        };
    };

    private _container = [_originIDC] call FUNC(getIDCContainer);
    if (_container isKindOf "CAManBase") then {
        _container = _container getVariable [QGVAR(droppedWeaponHolder), _container];
    };

    private _allWeaponsItems = weaponsItemsCargo _container;

    // Get all weapons in container that have the name of the weapon that was taken
    private _weaponsItemsWithName = _allWeaponsItems select {
        getText (configFile >> "CfgWeapons" >> _x#0 >> "displayName") == _displayName
    };

    // Get unique weapon attachment setups because identical ones stack
    private _allWeaponsItemsNoMags = _weaponsItemsWithName apply {_x select {!(_x isEqualType [])}};
    private _allWeaponsItemsUnique = _allWeaponsItemsNoMags arrayIntersect _allWeaponsItemsNoMags;
    private _weaponAttachmentSetup = _allWeaponsItemsUnique#_weaponIndex;
    private _weaponsItemsIndex = _allWeaponsItems findIf {
        (_x select {!(_x isEqualType [])}) isEqualTo _weaponAttachmentSetup
    };

    // Choose first occurance of this weapon setup from container
    private _weaponsItems = _allWeaponsItems#_weaponsItemsIndex;
    _allWeaponsItems deleteAt _weaponsItemsIndex;

    // Add weapon on back to container if there is one
    if (secondaryWeapon ACE_player == QGVAR(weapon)) then {
        private _weaponsItems = [ACE_player] call FUNC(get);
        _allWeaponsItems pushBack _weaponsItems;
    };

    // Remove setup from container
    clearWeaponCargoGlobal _container;
    {
        _container addWeaponWithAttachmentsCargoGlobal [_x, 1];
    } forEach _allWeaponsItems;

    [ACE_player, _weaponsItems] call FUNC(add);
};
