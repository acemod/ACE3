#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Causes the unit to detonate the passed explosive.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Max range (-1 to ignore) <NUMBER> (default: 0)
 * 2: Item <ARRAY> (default: [])
 * - 0: Explosive <OBJECT> (default: objNull)
 * - 1: Fuse time <NUMBER> (default: 0)
 * 3: Trigger item classname <STRING> (default: "#unknown")
 *
 * Return Value:
 * If explosive was successfully detonated <BOOL>
 *
 * Example:
 * [player, 100, [cursorObject, 1], "ACE_Clacker"] call ace_explosives_fnc_detonateExplosive; // has to be within range
 * [player, -1, [cursorObject, 1], "ACE_Cellphone"] call ace_explosives_fnc_detonateExplosive; // range ignored
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_range", 0, [0]], ["_item", [], [[]]], ["_triggerClassname", "#unknown", [""]]];
_item params [["_explosive", objNull, [objNull]], ["_fuseTime", 0, [0]]];
TRACE_4("detonateExplosive",_unit,_range,_item,_triggerClassname);

if (isNull _explosive) exitWith {
    WARNING_1("Explosive has been deleted [%1]",_this);

    false // return
};

if (_range != -1 && {(_unit distance _explosive) > _range}) exitWith {
    TRACE_1("out of range",_range);

    false // return
};

if !([_unit, _range, _explosive, _fuseTime, _triggerClassname] call FUNC(checkDetonateHandlers)) exitWith {
    TRACE_5("a detonation handler returned false",_unit,_range,_explosive,_fuseTime,_triggerClassname);

    false // return
};

// Have server detonate explosive after fusetime has passed
[QGVAR(detonate), [_unit, _explosive, _fuseTime]] call CBA_fnc_serverEvent;

true // return
