/*
 * Author: commy2
 * Returns the magazine of the units rangefinder.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Magazine of the units binocular <STRING>
 *
 * Example:
 * player call ace_common_fnc_binocularMagazine
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

private _binocular = binocular _unit;

scopeName "main";

{
    if ((_x select 0) isEqualTo _binocular) then {
        // note: if there is no magazine, _x(4,0) will be nil, which skips the breakOut.
        (_x select 4 select 0) breakOut "main";
    };
    false
} count weaponsitems _unit;

""
