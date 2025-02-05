#include "..\script_component.hpp"
/*
 * Author: DartRuffian, LinkIsGrim
 * Determines if a class is a miscellaneous item or not.
 *
 * Arguments:
 * 0: Item or magazine <STRING>
 * 1: Item config <CONFIG> (default: nil)
 * 2: Whether item is a magazine <BOOL> (default: false)
 * 3: Skip setting false keys in the cache, mostly used for building it during preStart <BOOL> (default: false)
 *
 * Return Value:
 * True if class is a misc item, otherwise false <BOOL>
 *
 * Example:
 * "ACE_CableTie" call ace_arsenal_fnc_isMiscItem
 *
 * Public: No
*/

params ["_item", "_config", ["_isMag", false], ["_skipFalseKeys", false]];
TRACE_4("",_item,_config,_isMag,_skipFalseKeys);

private _cache = uiNamespace getVariable QGVAR(isMiscItemCache);
private _return = _cache get _item;

// Don't replace with getOrDefaultCall, we want the key to only be set if return is true or _skipFalseKeys is false
if (isNil "_return") then {
    private _fnc_hasProperty = {getNumber (_config >> "ACE_asItem") == 1 || {getNumber (_config >> "ACE_isUnique") == 1}};

    _return = switch (true) do {
        case (_item isKindOf ["CBA_MiscItem", configFile >> "CfgWeapons"]): {true}; // CBA misc item, easy

        if (isNil "_config") then {
            _config = _item call CBA_fnc_getItemConfig;
        };

        case (_isMag): _fnc_hasProperty; // Magazine misc item, also easy

        private _itemType = getNumber (_config >> "ItemInfo" >> "type");

        case (_itemType in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT]): {true}; // Special items: Med/Toolkits
        case (_itemType in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD]): _fnc_hasProperty; // "Forced" misc items
        case ((getText (configFile >> "CfgWeapons" >> _item >> "simulation")) == "ItemMineDetector"): {true}; // Special items: mine detectors

        default {false}
    };

    if (_return || !_skipFalseKeys) then {
        _cache set [_item, _return];
    };
};

_return
