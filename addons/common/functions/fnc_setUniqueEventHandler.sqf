/*
 * Author: PabstMirror
 * Adds a unique event handler with a unique string handle.
 * Only stays on for the current unit and will be removed on repawn.
 * Pass emtpy code {} to remove.
 *
 * Arguments:
 * 0: Object (designed for units that can respawn) <OBJECT>
 * 1: Unique ID <STRING>
 * 2: Event Type <STRING>
 * 3: Event Handler <CODE>
 *
 * Return Value:
 * Added EH ID <NUMBER>
 *
 * Example:
 * [player, "firedTest", "FiredNear", {systemChat str _this}] call ace_common_fnc_setUniqueEventHandler;
 *
 * Public: Yes
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_uniqueID", "", [""]], ["_eventType", "", [""]], ["_code", {}, [{}]]];
TRACE_4("params",_unit,_uniqueID,_eventType,(_code isEqualTo {}));

if (isNull _unit) exitWith {-2};

private _varName = format [QGVAR(uniqueEH_%1_%2), _eventType, _uniqueID];
TRACE_1("",_varName);

// Remove old ID if it exists (regardless of unit)
private _ehID = (_unit getVariable _varName) param [3, -1];
if (_ehID != -1) then {
    _unit removeEventHandler [_eventType, _ehID];
    TRACE_2("Removed EH",_eventType,_ehID);
};

if (_code isEqualTo {}) then {
    _unit setVariable [_varName, nil];
    TRACE_1("empty code, clearing var",_varName);
    -1
} else {
    // Add event handler

    private _fnc_eh = {
        _thisArgs params ["_realUnit", "_ehFunc", "_uniqueID"];
        TRACE_5("event",_realUnit,_thisId,_uniqueID,_thisType,_this); // we get some of these variables from CBA
        if ((_this select 0) == _realUnit) then {
            _this call _ehFunc;
        } else {
            // Unit must have respawned, remove this EH
            [(_this select 0), _uniqueID, _thisType, {}] call FUNC(setUniqueEventHandler);
        };
    };
    private _ehArgs = [_unit, _code, _uniqueID];
    _ehID = [_unit, _eventType, _fnc_eh, _ehArgs] call CBA_fnc_addBISEventHandler;
    _ehArgs pushBack _ehID;

    TRACE_2("Added EH",_eventType,_ehID);

    _unit setVariable [_varName, _ehArgs];
    _ehID
};
