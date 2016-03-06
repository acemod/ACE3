#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(customFilters) = [];
GVAR(selectedFilterIndex) = -1;

// add custom filters

// generate list of grenades
GVAR(Grenades_ItemList) = [];

{
    GVAR(Grenades_ItemList) append getArray (configFile >> "CfgWeapons" >> "Throw" >> _x >> "magazines");
    false
} count getArray (configFile >> "CfgWeapons" >> "Throw" >> "muzzles");

// make list case insensitive
GVAR(Grenades_ItemList) = GVAR(Grenades_ItemList) apply {toLower _x};

// filter duplicates
GVAR(Grenades_ItemList) = GVAR(Grenades_ItemList) arrayIntersect GVAR(Grenades_ItemList);

[localize LSTRING(Grenades), QFUNC(filterGrenades)] call FUNC(addCustomFilter);

[localize LSTRING(Backpacks), QFUNC(filterBackpacks)] call FUNC(addCustomFilter);
[localize LSTRING(Uniforms), QFUNC(filterUniforms)] call FUNC(addCustomFilter);
[localize LSTRING(Vests), QFUNC(filterVests)] call FUNC(addCustomFilter);
[localize LSTRING(Headgear), QFUNC(filterHeadgear)] call FUNC(addCustomFilter);

// generate list of medical items
GVAR(Medical_ItemList) = [];

{
    GVAR(Medical_ItemList) append getArray (_x >> "items");
    false
} count (
    ("true" configClasses (configFile >> QEGVAR(Medical,Actions) >> "Basic")) +
    ("true" configClasses (configFile >> QEGVAR(Medical,Actions) >> "Advanced"))
);

// remove all numbers from list
GVAR(Medical_ItemList) = GVAR(Medical_ItemList) select {_x isEqualType ""};

// make list case insensitive
GVAR(Medical_ItemList) = GVAR(Medical_ItemList) apply {toLower _x};

// filter duplicates
GVAR(Medical_ItemList) = GVAR(Medical_ItemList) arrayIntersect GVAR(Medical_ItemList);

[localize LSTRING(Medical), QFUNC(filterMedical)] call FUNC(addCustomFilter);
