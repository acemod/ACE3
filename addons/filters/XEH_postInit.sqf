#include "script_component.hpp"

if (!hasInterface) exitWith {};

disableSerialization;

GVAR(customFilters) = [];
GVAR(selectedFilterIndex) = -1;

["inventoryDisplayLoaded", {_this call FUNC(inventoryDisplayLoaded)}] call EFUNC(common,addEventHandler);

// add custom filters
DFUNC(filterBackpacks) = {
    params ["_config"];
    getNumber (_config >> "isBackpack") == 1
};

[localize LSTRING(Backpacks), QFUNC(filterBackpacks)] call FUNC(addCustomFilter);

DFUNC(filterUniforms) = {
    params ["_config"];
    getNumber (_config >> "ItemInfo" >> "type") == 801
};

[localize LSTRING(Uniforms), QFUNC(filterUniforms)] call FUNC(addCustomFilter);

DFUNC(filterVests) = {
    params ["_config"];
    getNumber (_config >> "ItemInfo" >> "type") == 701
};

[localize LSTRING(Vests), QFUNC(filterVests)] call FUNC(addCustomFilter);
