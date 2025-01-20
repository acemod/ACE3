#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to replace a persons Uniform while maintaining the content of the uniform.
 *
 * Arguments:
 * 0: Unit <Object>
 * 1: Current Variant <CONFIG>
 * 2: Desired Variant <CONFIG>
 * 2: Type of Wearable Container <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _cfg_origin, _cfg_tgt, _case] call ace_wardrobe_fnc_replace_uniform
 *
 * Public: No
 */

params ["_player", "_cfg_origin", "_cfg_tgt", "_case"];

toFixed 0;
private _magazineDetails = (magazinesAmmoFull _player) apply { [_x#0, _x#-2, _x#-1] };
private _loadout = [_player] call CBA_fnc_getLoadout;


//// Handle Special Cases - Pre Replace
// ACE Intel Items
INTEL_PRE(_hasDocument,acex_intelitems_document);
INTEL_PRE(_hasNotepad,acex_intelitems_notepad);
INTEL_PRE(_hasPhoto,acex_intelitems_photo);

// ACE Overheating
private _hasSpareBarrel = _magazineDetails findIf { _x#0 isEqualTo "ACE_SpareBarrel" } > -1;
if (_hasSpareBarrel) then { _hasSpareBarrel = [_player, "ACE_SpareBarrel" ] call CBA_fnc_getMagazineIndex };


//// Replace Wearable
// Change Wearable
switch (_case) do {
    case "UNIFORM":  { _loadout # 0 # 3 set [0, configName _cfg_tgt]; };
    case "VEST":     { _loadout # 0 # 4 set [0, configName _cfg_tgt]; };
    case "BACKPACK": { _loadout # 0 # 5 set [0, configName _cfg_tgt]; };
    default { ERROR_1("Case undefined: %1",_case); };
};

// Apply new Loadout
[_player, _loadout] call CBA_fnc_setLoadout;


//// Handle Special Cases - Post Replace
// ACE Intel Items
INTEL_POST(_hasDocument,acex_intelitems_document);
INTEL_POST(_hasNotepad,acex_intelitems_notepad);
INTEL_POST(_hasPhoto,acex_intelitems_photo);

// ACE Overheating
if (_hasSpareBarrel isEqualType [] ) then {
    private _SpareBarrel_new_MagIDs = [_player, "ACE_SpareBarrel"] call CBA_fnc_getMagazineIndex;
    [QGVAR(EH_updateMagIDs), [_hasSpareBarrel, _SpareBarrel_new_MagIDs]] call CBA_fnc_serverEvent;
};
