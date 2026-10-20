#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Adds an explosive as a clacker item to the passed unit if the unit has the required item.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Explosive <OBJECT> (default: objNull)
 * 2: Magazine classname <STRING> (default: "")
 * 3: Extra variables <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "SatchelCharge_Remote_Mag", [configFile >> "ACE_Triggers" >> "Command"]] call ace_explosives_fnc_addClacker
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_explosive", objNull, [objNull]], ["_magazineClass", "", [""]], ["_extra", [], [[]]]];
TRACE_4("params",_unit,_explosive,_magazineClass,_extra);

if (isNull _unit || {isNull _explosive} || {_magazineClass == ""} || {_extra isEqualTo []}) exitWith {};

// Config is the last param in extra
private _triggerConfig = _extra select -1;

if (isNil "_triggerConfig" || {!(_triggerConfig isEqualType configNull)} || {isNull _triggerConfig}) exitWith {};

// Check if unit has all required detonators for specific trigger
private _detonators = _unit call FUNC(getDetonators);

if ((getArray (_triggerConfig >> "requires")) findIf {!((_x call EFUNC(common,getConfigName)) in _detonators)} != -1) exitWith {};

GVAR(placedCount) = GVAR(placedCount) + 1;

private _triggerConfigName = configName _triggerConfig;
private _clackerList = _unit getVariable [QGVAR(clackers), []];

_clackerList pushBack [
    _explosive,
    getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "ACE_Triggers" >> _triggerConfigName >> "FuseTime"),
    format [
        LLSTRING(DetonateCode),
        GVAR(placedCount)
    ],
    _magazineClass,
    _triggerConfigName
];

_unit setVariable [QGVAR(clackers), _clackerList, true];

// Display clacker code message
[format [LLSTRING(DetonateCode), GVAR(placedCount)]] call EFUNC(common,displayTextStructured);

// API
[QGVAR(clackerAdded), [_unit, _explosive, GVAR(placedCount)]] call CBA_fnc_localEvent;
