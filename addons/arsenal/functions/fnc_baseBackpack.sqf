#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns base backpack for a preset (loaded/AI) backpack variant
 * Basically CBA_fnc_getNonPresetClass with model checking, as some backpacks don't have variants with no cargo (#10346)
 *
 * Arguments:
 * 0: Backpack classname <STRING>
 *
 * Return Value:
 * Most viable base backpack class, "" if not a backpack <STRING>
 *
 * Example:
 * "B_Kitbag_rgr_Exp" call ace_arsenal_fnc_baseBackpack
 *
 * Public: Yes
 */

params [["_item", "", [""]]];

TRACE_1("looking up base backpack",_item);

(uiNamespace getVariable QGVAR(baseBackpackCache)) getOrDefaultCall [toLowerANSI _item, {
    private _config = configFile >> "CfgVehicles" >> _item;
    // TODO: handle file extension differences (implicit vs explicit .p3d)
    // model could have missing file extension in a variant and present in parent, but that's stupid, bad config.
    // It'll be inherited and match 99% of the time. Good enough until it burns, see texture checking below.
    private _model = getText (_config >> "model");

    // Texture checking is a can of worms: we'd have to create a hashmap nConfigs + 1 times and see if they match...
    // ...and it wouldn't handle small things like custom patches or name tags
    // If this ever comes up (it likely will), we'll burn that bridge when we get to it.
    // private _textures = getArray (_config >> "hiddenSelectionsTextures");

    while {
        (isClass _config) &&
        {getNumber (_config >> "scope") > 0} && // Some preset backpacks are scope = 1
        {getText (_config >> "model") == _model}
        // && {getArray (_config >> "hiddenSelectionsTextures") isEqualTo _textures}
    } do {
        if (
            (count (_config >> "TransportItems") == 0) &&
            {count (_config >> "TransportMagazines") == 0} &&
            {count (_config >> "TransportWeapons") == 0}
        ) then {
            break;
        };
        _config = inheritsFrom _config;
    };

    configName _config // return, will be "" if not a backpack
}, true]
