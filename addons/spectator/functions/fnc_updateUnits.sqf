#include "script_component.hpp"

// Remove dead and null units
GVAR(unitList) - [objNull];
GVAR(unitList) - allDead;

// Fetch new units for list
{
    if (
        (simulationEnabled _x) &&
        {(side _x) in [west,east,resistance,civilian] } &&
        //{!isObjectHidden _unit} && // (currently dev branch only)
        {!(_x getVariable [QGVAR(isSpectator), false])} // Who watches the watchmen?
    ) then {
        GVAR(unitList) pushBack _x;
    };
} forEach (allUnits - GVAR(unitList));

disableSerialization;
_display = GETUVAR(GVAR(display),displayNull);
_ctrl = _display displayCtrl IDC_TREE;

// Clear the tree
_ctrl tvCollapse [];

// Update the tree
{
   // _ctrl tvAdd [[,_forEachIndex], name _x];
} forEach GVAR(unitList);
