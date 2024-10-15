#define DEBUG_MODE_FULL
#include "..\script_component.hpp"
/*
 * Author: DartRuffian, LinkIsGrim
 * Determines if a class is a miscellaneous item or not.
 *
 * Arguments:
 * 0: Item or magazine <STRING>
 * 1: Item config <CONFIG> (default: nil)
 * 2: Item is magazine, if true, config should be passed as well <BOOL> (default: false)
 *
 * Return Value:
 * True if class is a misc item, otherwise false <BOOL>
 *
 * Example:
 * "ACE_CableTie" call ace_arsenal_fnc_isMiscItem
 *
 * Public: No
*/

params ["_item", "_config", ["_isMag", false]];
TRACE_3("",_item,_config,_isMag);

(uiNamespace getVariable QGVAR(isMiscItemCache)) getOrDefaultCall [_item, {
    private _fnc_hasProperty = {getNumber (_config >> "ACE_asItem") == 1 || {getNumber (_config >> "ACE_isUnique") == 1}};
    switch (true) do {
        case (_item isKindOf ["CBA_MiscItem", configFile >> "CfgWeapons"]): {true}; // CBA misc item, easy
        case (_isMag): _fnc_hasProperty; // Magazine misc item. Also easy.

        if (isNil "_config") then {
            _config = _item call CBA_fnc_getItemConfig;
        };
        private _itemType = getNumber (_config >> "ItemInfo" >> "type");

        case (_itemType in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT]): {true}; // Special items: Med/Toolkits
        case (_itemType in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD]): _fnc_hasProperty; // "Forced" misc items
        case ((getText (configFile >> "CfgWeapons" >> _item >> "simulation")) == "ItemMineDetector"): {true}; // Special items: mine detectors

        default {false}
    };
}, true]
