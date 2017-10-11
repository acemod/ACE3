/*
 * Author: BaerMitUmlaut, 654wak654, Dystopian
 * Generates the CfgVehicles config to disable openable driver and cargo doors.
 * Based on nouniformrestrictions export script.
 *
 * Arguments:
 * 0: Mod folder (default: any) <STRING>
 *
 * Return Value:
 * CfgVehicles Content <STRING>
 *
 * Example:
 * ["@rhs_afrf3"] call ace_quickmount_fnc_exportNoDoorsConfig
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_modFolder", ""]];

private _modifyClasses = [];
private _baseClasses = [];
{
    if (
        (_modFolder == "" || {_modFolder in configSourceModList _x})
        && (
            !isNull (_x >> "driverDoor")
            && {(_x >> "driverDoor") in (configProperties [_x, "true", false])}
            && {"" != getText (_x >> "driverDoor")}
            || {
                !isNull (_x >> "cargoDoors")
                && {(_x >> "cargoDoors") in (configProperties [_x, "true", false])}
                && {!([] isEqualTo getArray (_x >> "cargoDoors"))}
            }
        )
    ) then {
        private _baseClass = inheritsFrom _x;
        _modifyClasses pushBackUnique [_x, _baseClass];
        if !(_baseClass in (_modifyClasses apply {_x select 0})) then {
            _baseClasses pushBackUnique _baseClass;
        };
    };
    false
} count ("true" configClasses (configFile >> "CfgVehicles"));

private _nl = toString [13, 10];
private _output = "class CfgVehicles {" + _nl;
{
    ADD(_output,format [ARR_3("    class %1;%2",configName _x,_nl)]);
    false
} count _baseClasses;
ADD(_output,_nl);
{
    _x params ["_class", "_parent"];
    ADD(_output,format [ARR_4("    class %1: %2 {%3        driverDoor = """";%3        cargoDoors[] = {};%3    };%3",configName _class,configName _parent,_nl)]);
    false
} count _modifyClasses;
ADD(_output,"};");

copyToClipboard _output;
_output;
