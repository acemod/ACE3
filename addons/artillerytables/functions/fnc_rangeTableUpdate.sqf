#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Called when listbox selection changes.  Updates the rangetable with new values.
 *
 * Arguments:
 * 0: Elevation Mode (true = high,false=low) <BOOL><OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_artillerytables_fnc_rangeTableUpdate
 *
 * Public: No
 */

private _dialog = uiNamespace getVariable [QGVAR(rangeTableDialog), displayNull];
private _ctrlRangeTable = _dialog displayCtrl IDC_TABLE;
private _ctrlChargeList = _dialog displayCtrl IDC_CHARGELIST;
private _ctrlElevationHigh = _dialog displayCtrl IDC_BUTTON_ELEV_HIGH;
private _ctrlElevationLow = _dialog displayCtrl IDC_BUTTON_ELEV_LOW;

GVAR(lastElevationMode) = param [0, GVAR(lastElevationMode)]; // update if passed a new value
GVAR(lastCharge) = lbCurSel _ctrlChargeList;

// get data for currently selected mag/mode combo:
(GVAR(magModeData) select GVAR(lastCharge)) params [["_muzzleVelocity", -1], ["_airFriction", 0]];
private _elevMin = _dialog getVariable [QGVAR(elevMin), 0];
private _elevMax = _dialog getVariable [QGVAR(elevMax), 0];
_ctrlElevationHigh ctrlSetTextColor ([[0.25,0.25,0.25,1],[1,1,1,1]] select GVAR(lastElevationMode));
_ctrlElevationLow ctrlSetTextColor ([[1,1,1,1],[0.25,0.25,0.25,1]] select GVAR(lastElevationMode));


lnbClear _ctrlRangeTable;
// Call extension with current data and start workers
TRACE_5("callExtension:artillery:calculate_table",_muzzleVelocity,_airFriction,_elevMin,_elevMax,GVAR(lastElevationMode));
(
    "ace" callExtension ["artillery:calculate_table", [_muzzleVelocity,_airFriction,_elevMin,_elevMax,GVAR(lastElevationMode)]]
) params ["_data", "_code"];
TRACE_1("",_code)

GVAR(tableData) = createHashMap;
GVAR(tableSizeActual) = (parseSimpleArray _data) select 1;
GVAR(tableSizeReceived) = 0;
