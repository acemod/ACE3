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
    _item isKindOf ["CBA_MiscItem", configFile >> "CfgWeapons"] || { // CBA misc item, easy
        // Non-CBA misc item: either a magazine item, special item (FAK, Toolkit, minedetector), or an item forced to be sorted as misc.
        if (_isMag) then {
            getNumber (_config >> "ACE_asItem") == 1 || {getNumber (_config >> "ACE_isUnique") == 1} // return
        } else {
            if (isNil "_config") then {
                _config = _item call CBA_fnc_getItemConfig;
            };
            private _configItemInfo = _config >> "ItemInfo";
            ( // Special items
                getNumber (_configItemInfo >> "type") in [TYPE_FIRST_AID_KIT, TYPE_MEDIKIT, TYPE_TOOLKIT] ||
                {getText (_cfgWeapons >> _x >> "simulation") == "ItemMineDetector"}
            ) || {
                getNumber (_configItemInfo >> "type") in [TYPE_MUZZLE, TYPE_OPTICS, TYPE_FLASHLIGHT, TYPE_BIPOD] && // We don't want weapons to be sorted as misc items ever
                {getNumber (_config >> "ACE_asItem") == 1 || {getNumber (_config >> "ACE_isUnique") == 1}} // return
            } // return
        }
    }
}, true]
