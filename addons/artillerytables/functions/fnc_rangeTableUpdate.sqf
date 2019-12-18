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
TRACE_5("callExtension:start",_muzzleVelocity,_airFriction,_elevMin,_elevMax,GVAR(lastElevationMode));
private _ret = "ace_artillerytables" callExtension ["start", [_muzzleVelocity,_airFriction,_elevMin,_elevMax,GVAR(lastElevationMode)]];
TRACE_1("",_ret);

// Non-blocking read data out of extension as it becomes availiable
[{
    private _dialog = uiNamespace getVariable [QGVAR(rangeTableDialog), displayNull];
    private _ctrlRangeTable = _dialog displayCtrl IDC_TABLE;
    if (isNull _dialog) exitWith {true};

    private _status = 1; // 1 = data on line, 2 - data not ready, 3 - done
    while {_status == 1} do {
        private _ret = ("ace_artillerytables" callExtension ["getline", []]);
        // TRACE_1("callExtension:getline",_ret);
        _status = _ret select 1;
        if (_status == 1) then { _ctrlRangeTable lnbAddRow parseSimpleArray (_ret select 0) };
    };

    (_status == 3) // exit loop when all data read
}, {
    // put dummy line at end because scrolling is problematic and can't see last line
    private _dialog = uiNamespace getVariable [QGVAR(rangeTableDialog), displayNull];
    private _ctrlRangeTable = _dialog displayCtrl IDC_TABLE;
    if (isNull _dialog) exitWith {TRACE_1("dialog closed",_this);};

    _ctrlRangeTable lnbAddRow ["", "", "", "", "", "", "", "", "", "", ""];
    TRACE_1("table filled",_ctrlRangeTable);
}, []] call CBA_fnc_waitUntilAndExecute;
