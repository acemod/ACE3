#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a units wearable container while maintaining the content of the container.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Desired variant as classname <STRING>
 * 2: Type of wearable container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "U_B_CTRG_3", UNIFORM] call ace_wardrobe_fnc_replaceContainer
 * [player, "U_B_CTRG_1", UNIFORM] call ace_wardrobe_fnc_replaceContainer
 *
 * Public: No
 */

params ["_player", "_classTarget", "_equipmentType"];

toFixed 0;
private _magazineDetails = (magazinesAmmoFull _player) apply { [_x#0, _x#-2, _x#6] };
private _loadout = _player call CBA_fnc_getLoadout;

// handle special cases - pre replace
// ace intel items
INTEL_PRE(_document,acex_intelitems_document);
INTEL_PRE(_notepad,acex_intelitems_notepad);
INTEL_PRE(_photo,acex_intelitems_photo);

// ace overheating
private _spareBarrel = _magazineDetails findIf { _x#0 == "ACE_SpareBarrel" } > -1;
if (_spareBarrel) then { _spareBarrel = [_player, "ACE_SpareBarrel"] call CBA_fnc_getMagazineIndex };

// replace wearable
switch (_equipmentType) do {
    case "UNIFORM":  { _loadout # 0 # 3 set [0, _classTarget]; };
    case "VEST":     { _loadout # 0 # 4 set [0, _classTarget]; };
    case "BACKPACK": { _loadout # 0 # 5 set [0, _classTarget]; };
};

// apply new loadout
[_player, _loadout] call CBA_fnc_setLoadout;

// handle special cases - post replace
// ace intel items
INTEL_POST(_document,acex_intelitems_document);
INTEL_POST(_notepad,acex_intelitems_notepad);
INTEL_POST(_photo,acex_intelitems_photo);

// ace overheating
if (_spareBarrel isEqualType []) then {
    private _newMagIDsSpareBarrel = [_player, "ACE_SpareBarrel"] call CBA_fnc_getMagazineIndex;
    [QGVAR(updateMagIDs), [_spareBarrel, _newMagIDsSpareBarrel]] call CBA_fnc_serverEvent;
};
