#include "script_component.hpp"

if (!hasInterface) exitWith {};

// cache config
// items in the inventory display can only be distinguished by their lb names and pictures
// this can cause collisions (mainly weapons with attachments),
// but if the item has the same name and picture it at least shouldn't change the filter anyway
// luckily we don't need private items, so dummy and parent classes are out of the picture

GVAR(ItemKeyNamespace) = [] call CBA_fnc_createNamespace;
private _allItems = uiNamespace getVariable [QGVAR(ItemKeyCache), []]; //See XEH_preStart.sqf

// isEqualType is hacking protection as we cannot trust that the cache hasn't been manipulated
{
    if (_x isEqualType [] && {_x isEqualTypeArray ["", configNull]}) then {
        GVAR(ItemKeyNamespace) setVariable _x;
    };
} forEach ([[], _allItems] select (_allItems isEqualType []));

GVAR(customFilters) = [];
GVAR(selectedFilterIndex) = -1;

// add custom filters

// get list of grenades
GVAR(Grenades_ItemList) = uiNamespace getVariable [QGVAR(Grenades_ItemList), []];
if (!(GVAR(Grenades_ItemList) isEqualType [])) then {GVAR(Grenades_ItemList) = []};

[localize LSTRING(Grenades), QFUNC(filterGrenades)] call FUNC(addCustomFilter);

[localize LSTRING(Backpacks), QFUNC(filterBackpacks)] call FUNC(addCustomFilter);
[localize LSTRING(Uniforms), QFUNC(filterUniforms)] call FUNC(addCustomFilter);
[localize LSTRING(Vests), QFUNC(filterVests)] call FUNC(addCustomFilter);
[localize LSTRING(Headgear), QFUNC(filterHeadgear)] call FUNC(addCustomFilter);

// get list of medical items
GVAR(Medical_ItemList) = uiNamespace getVariable [QGVAR(Medical_ItemList), []];
if (!(GVAR(Medical_ItemList) isEqualType [])) then {GVAR(Medical_ItemList) = []};

[localize LSTRING(Medical), QFUNC(filterMedical)] call FUNC(addCustomFilter);
