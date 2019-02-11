#include "script_component.hpp"

if (!hasInterface) exitWith {};

// cache config
// items in the inventory display can only be distinguished by their lb names and pictures
// this can cause collisions (mainly weapons with attachments),
// but if the item has the same name and picture it at least shouldn't change the filter anyway
// luckily we don't need private items, so dummy and parent classes are out of the picture

GVAR(ItemKeyNamespace) = [] call CBA_fnc_createNamespace;
private _allItems = call (uiNamespace getVariable [QGVAR(ItemKeyCache), {[]}]); //See XEH_preStart.sqf

{
    GVAR(ItemKeyNamespace) setVariable _x;
} forEach _allItems;

GVAR(customFilters) = [];
GVAR(selectedFilterIndex) = -1;

// add custom filters

// get list of grenades
GVAR(Grenades_ItemList) = call (uiNamespace getVariable [QGVAR(Grenades_ItemList), {[]}]);

[localize LSTRING(Grenades), QFUNC(filterGrenades)] call FUNC(addCustomFilter);

[localize LSTRING(Backpacks), QFUNC(filterBackpacks)] call FUNC(addCustomFilter);
[localize LSTRING(Uniforms), QFUNC(filterUniforms)] call FUNC(addCustomFilter);
[localize LSTRING(Vests), QFUNC(filterVests)] call FUNC(addCustomFilter);
[localize LSTRING(Headgear), QFUNC(filterHeadgear)] call FUNC(addCustomFilter);

// get list of medical items
GVAR(Medical_ItemList) = call (uiNamespace getVariable [QGVAR(Medical_ItemList), {[]}]);

[localize LSTRING(Medical), QFUNC(filterMedical)] call FUNC(addCustomFilter);
