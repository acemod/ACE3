/*
 * Author: PabstMirror
 * Makes any object loadable.  Needs to be called on all machines.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Set as loadable (default: true) <BOOL><SCALAR>
 * 2: Size. (default: 1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, true, 1] call ace_cargo_fnc_makeLoadable
 *
 * Public: Yes
 */
#include "script_component.hpp"

// Only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(makeLoadable), _this];
};

ACE_DEPRECATED(QFUNC(makeLoadable),"3.12.0",QFUNC(setSize));

params [["_object", objNull, [objNull]], ["_canLoad", true, [false, 0]], ["_setSize", 1, [0]]];
TRACE_3("params",_object,_canLoad,_setSize);

if (isNull _object) exitWith {TRACE_1("null",_object);};
private _type = typeOf _object;
private _cfgCanLoad = getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(canLoad));
private _curSize = [_object] call FUNC(getSizeItem);

_canLoad = [0, 1] select _canLoad; // Convert true/false to scalar

if ((_canLoad == 1) && {_setSize <= 0}) exitWith {
    ERROR("ace_cargo_fnc_makeLoadable (size <= 0) when making loadable");
};

TRACE_2("setVar if different from config",_canLoad,_cfgCanLoad);
if (_canLoad != _cfgCanLoad) then {
    _object setVariable [QGVAR(canLoad), _canLoad == 1];
};

TRACE_2("setVar if different from config",_setSize,_curSize);
if (_setSize != _curSize) then {
    _object setVariable [QGVAR(size), _setSize];
};

//Add the load actions to the object class if not already added
[_object] call FUNC(initObject);

nil
