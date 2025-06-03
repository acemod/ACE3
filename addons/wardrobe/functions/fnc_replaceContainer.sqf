#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to replace a units wearable container while maintaining the content of the container.
 *
 * Arguments:
 * 0: Unit <Object>
 * 1: Desired variant <CONFIG>
 * 2: Type of wearable container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _cfgTarget, _equipmentType] call ace_wardrobe_fnc_replaceContainer
 *
 * Public: No
 */

params ["_player", "_cfgTarget", "_equipmentType"];

toFixed 0;
private _magazineDetails = (magazinesAmmoFull _player) apply { [_x#0, _x#-2, _x#-1] };
private _loadout = _player call CBA_fnc_getLoadout;


//// handle special cases - pre replace
// ace intel items
INTEL_PRE(_hasDocument,acex_intelitems_document);
INTEL_PRE(_hasNotepad,acex_intelitems_notepad);
INTEL_PRE(_hasPhoto,acex_intelitems_photo);

// ace overheating
private _hasSpareBarrel = _magazineDetails findIf { _x#0 isEqualTo "ACE_SpareBarrel" } > -1;
if (_hasSpareBarrel) then { _hasSpareBarrel = [_player, "ACE_SpareBarrel" ] call CBA_fnc_getMagazineIndex };


//// replace wearable
// change wearable
switch (_equipmentType) do {
    case "UNIFORM":  { _loadout # 0 # 3 set [0, configName _cfgTarget]; };
    case "VEST":     { _loadout # 0 # 4 set [0, configName _cfgTarget]; };
    case "BACKPACK": { _loadout # 0 # 5 set [0, configName _cfgTarget]; };
};

// apply new loadout
[_player, _loadout] call CBA_fnc_setLoadout;


//// handle special cases - post replace
// ace intel items
INTEL_POST(_hasDocument,acex_intelitems_document);
INTEL_POST(_hasNotepad,acex_intelitems_notepad);
INTEL_POST(_hasPhoto,acex_intelitems_photo);

// ace overheating
if (_hasSpareBarrel isEqualType []) then {
    private _newMagIDsSpareBarrel = [_player, "ACE_SpareBarrel"] call CBA_fnc_getMagazineIndex;
    [QGVAR(updateMagIDs), [_hasSpareBarrel, _newMagIDsSpareBarrel]] call CBA_fnc_serverEvent;
};
