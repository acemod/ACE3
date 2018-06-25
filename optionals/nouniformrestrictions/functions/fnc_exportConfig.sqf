#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, 654wak654
 * Generates the CfgVehicles config to allow uniform usage on all sides.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * CfgVehicles Content <STRING>
 *
 * Example:
 * [] call ace_nouniformrestrictions_fnc_exportConfig
 *
 * Public: Yes
 */

private _modifyClasses = [];
private _baseClasses = [];
{
    private _baseClass = inheritsFrom _x;
    _modifyClasses pushBackUnique [_x, _baseClass];
    if !(_baseClass in (_modifyClasses apply {_x select 0})) then {
        _baseClasses pushBackUnique _baseClass;
    };
    false
} count (
    ("!isNull (_x >> 'modelSides') &&" +
    "{(_x >> 'modelSides') in (configProperties [_x, 'true', false])} &&" +
    "{!(getArray (_x >> 'modelSides') isEqualTo [6])} &&" +
    "{!(getArray (_x >> 'modelSides') isEqualTo [0,1,2,3])}")
    configClasses (configFile >> "CfgVehicles")
);

private _nl = toString [13, 10];
private _output = "class CfgVehicles {" + _nl;
{
    ADD(_output,format [ARR_3("    class %1;%2",configName _x,_nl)]);
    false
} count _baseClasses;
ADD(_output,_nl);
{
    _x params ["_class", "_parent"];
    ADD(_output,format [ARR_4("    class %1: %2 {%3        modelSides[] = {6};%3    };%3",configName _class,configName _parent,_nl)]);
    false
} count _modifyClasses;
ADD(_output,"};");

copyToClipboard _output;
_output;
