#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Returns array of required nearby repair objects (wheels/tracks).
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Max range to seach from unit (meters) <NUMBER>
 * 2: Array of arrays of classnames <ARRAY>
 *
 * Return Value:
 * Array of objects, or [] if not all available <ARRAY>
 *
 * Example:
 * [player, 5, [["Ace_Track"]]] call ace_repair_fnc_getClaimObjects
 *
 * Public: Yes
 */

params ["_unit", "_maxRange", "_objectsToClaim"];
TRACE_3("params",_unit,_maxRange,_objectsToClaim);

private _return = [];

{
    private _requiredList = _x; //eg ["ace_track", "ace_track"]
    private _ableToAquire = []; //will be array of objects
    {
        private _nearObjects =  _unit nearEntities [_x, _maxRange];
        {
            if (!(_x in _ableToAquire) && {(_x getVariable [QEGVAR(common,owner), objNull]) in [objNull, _unit]}) exitWith { // skip claimed objects
                _ableToAquire pushBack _x
            };
        } forEach _nearObjects;
    } forEach _requiredList;
    TRACE_2("Check required equals available",_requiredList,_ableToAquire);
    if ((count _ableToAquire) == (count _requiredList)) exitWith {_return = _ableToAquire};
} forEach _objectsToClaim;

_return
