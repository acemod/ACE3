/*
 * Author: PabstMirror
 * Called when listbox selection changes.  Updates the rangetable with new values.
 *
 * Arguments:
 * No
 *
 * Return Value:
 * No
 *
 * Example:
 * [] call ace_mk6mortar_fnc_rangeTablePageChange
 *
 * Public: No
 */
#include "script_component.hpp"

#define RANGE_TABLE       ((uiNamespace getVariable "ACE_82mm_RangeTable_Dialog") displayCtrl 20001)
#define LIST_CHARGE       ((uiNamespace getVariable "ACE_82mm_RangeTable_Dialog") displayCtrl 1501)

_listBoxData = LIST_CHARGE lbData (lbCurSel LIST_CHARGE);
if (isNil "_listBoxData" || {_listBoxData == ""}) exitWith {ERROR("lbCurSel out of bounds or no data");};
_muzzleVelocity = parseNumber _listBoxData;

_precalcArray = [_muzzleVelocity, MK6_82mm_AIR_FRICTION] call FUNC(rangeTablePreCalculatedValues);

lnbClear RANGE_TABLE;
{
    RANGE_TABLE lnbAddRow _x;
} forEach _precalcArray;

//put dummy line at end because scrolling is fucked and can't see last line
RANGE_TABLE lnbAddRow ["", "", "", "", "", "", "", "", "", "", ""];
