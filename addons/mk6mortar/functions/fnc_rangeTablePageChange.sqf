#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Called when listbox selection changes.  Updates the rangetable with new values.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_mk6mortar_fnc_rangeTablePageChange
 *
 * Public: No
 */

#define RANGE_TABLE       ((uiNamespace getVariable "ACE_82mm_RangeTable_Dialog") displayCtrl 20001)
#define LIST_CHARGE       ((uiNamespace getVariable "ACE_82mm_RangeTable_Dialog") displayCtrl 1501)

private _listBoxData = LIST_CHARGE lbData (lbCurSel LIST_CHARGE);
if (isNil "_listBoxData" || {_listBoxData == ""}) exitWith {ERROR("lbCurSel out of bounds or no data");};
private _muzzleVelocity = parseNumber _listBoxData;

private _airFriction = if (GVAR(airResistanceEnabled)) then {MK6_82mm_AIR_FRICTION} else {0};

private _precalcArray = [_muzzleVelocity, _airFriction] call FUNC(rangeTablePreCalculatedValues);

lnbClear RANGE_TABLE;
{
    RANGE_TABLE lnbAddRow _x;
} forEach _precalcArray;

//put dummy line at end because scrolling is fucked and can't see last line
RANGE_TABLE lnbAddRow ["", "", "", "", "", "", "", "", "", "", ""];
