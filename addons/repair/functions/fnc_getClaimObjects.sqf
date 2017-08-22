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
#include "script_component.hpp"

params ["_unit", "_maxRange", "_objectsToClaim"];
TRACE_3("params",_unit,_maxRange,_objectsToClaim);

private _return = [];

{
    private _requiredList = _x; //eg ["ace_track", "ace_track"]
    private _ableToAquire = []; //will be array of ojbects
    {
        private _nearObjects = nearestObjects [_unit, [_x], _maxRange];
        private _canClaimObject = objNull;
        {
            if ((!(_x in _ableToAquire))
                    && {[_unit, _x, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)}
                    &&{(damage _x) < 1}
                    ) exitWith { _canClaimObject = _x; };
        } forEach _nearObjects;
        if (isNull _canClaimObject) exitWith {};
        _ableToAquire pushBack _canClaimObject;
    } forEach _x;
    TRACE_2("Check required equals available",_requiredList,_ableToAquire);
    if ((count _ableToAquire) == (count _requiredList)) exitWith {_return = _ableToAquire};
    false
} count _objectsToClaim;

_return
