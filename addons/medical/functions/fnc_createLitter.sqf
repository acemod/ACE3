/*
 * Author: Glowbal
 * Spawns litter for the treatment action on the ground around the target
 *
 * Arguments:
 * 0: The Caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: The treatment Selection Name <STRING>
 * 3: The treatment classname <STRING>
 * 4: ? <UNKNOWN>
 * 5: Users of Items <UNKNOWN>
 * 6: Blood Loss on selection (previously called _previousDamage) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "selection", "classname", , , 5] call ACE_medical_fnc_createLitter
 *
 * Public: No
 */

#include "script_component.hpp"

#define MIN_ENTRIES_LITTER_CONFIG 3

params ["_caller", "_target", "_selectionName", "_className", "", "_usersOfItems", "_bloodLossOnSelection"];
TRACE_6("params",_caller,_target,_selectionName,_className,_usersOfItems,_bloodLossOnSelection);

//Ensures comptibilty with other possible medical treatment configs
private _previousDamage = _bloodLossOnSelection;

if !(GVAR(allowLitterCreation)) exitwith {};
if (vehicle _caller != _caller || {vehicle _target != _target}) exitwith {};

private _config = if (GVAR(level) >= 2) then {
    (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
} else {
    (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className)
};
if !(isClass _config) exitwith {TRACE_1("No action config", _className);};

if !(isArray (_config >> "litter")) exitwith {TRACE_1("No litter config", _className);};
private _litter = getArray (_config >> "litter");

private _createLitter = {
    params ["_unit", "_litterClass"];
    // @TODO: handle carriers over water
    // For now, don't spawn litter if we are over water to avoid floating litter
    if (surfaceIsWater (getPos _unit)) exitWith { false };

    private _position = getPosATL _unit;
    _position params ["_posX", "_posY", "_posZ"];
    _position = [_posX + (random 2) - 1, _posY + (random 2) - 1, _posZ];

    private _direction = (random 360);

    // Create the litter, and timeout the event based on the cleanup delay
    // The cleanup delay for events in MP is handled by the server side
    TRACE_3("Creating Litter on server",_litterClass,_position,_direction);
    [QGVAR(createLitterServer), [_litterClass, _position, _direction]] call CBA_fnc_serverEvent;

    true
};

private _createdLitter = [];
{
    if (_x isEqualType []) then {
        if (count _x < MIN_ENTRIES_LITTER_CONFIG) exitwith {};

        _x params ["_selection", "_litterCondition", "_litterOptions"];

        if (toLower _selection in [toLower _selectionName, "all"]) then { // in is case sensitve. We can be forgiving here, so lets use toLower.

            if (isnil _litterCondition) then {
                _litterCondition = if (_litterCondition != "") then {compile _litterCondition} else {{true}};
            } else {
                _litterCondition = missionNamespace getVariable _litterCondition;
                if (!(_litterCondition isEqualType {})) then {_litterCondition = {false}};
            };
            if !([_caller, _target, _selectionName, _className, _usersOfItems, _bloodLossOnSelection] call _litterCondition) exitwith {};

            if (_litterOptions isEqualType []) then {
                // Loop through through the litter options and place the litter
                {
                    if (_x isEqualType [] && {(count _x > 0)}) then {
                        [_target, selectRandom _x] call _createLitter;
                    };
                    if (_x isEqualType "") then {
                        [_target, _x] call _createLitter;
                    };
                } foreach _litterOptions;
            };
        };
    };
} foreach _litter;
