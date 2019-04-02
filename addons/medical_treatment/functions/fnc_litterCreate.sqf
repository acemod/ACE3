#include "script_component.hpp"
/*
 * Author: Glowbal
 * Spawns litter for the treatment action on the ground around the target
 *
 * Arguments:
 * 0: The Caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: The treatment Selection Name <STRING>
 * 3: The treatment classname <STRING>
 * 4: ?
 * 5: Users of Items <?>
 * 6: Blood Loss on selection (previously called _previousDamage) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#define MIN_ENTRIES_LITTER_CONFIG 3

params ["_caller", "_target", "_selectionName", "_className", "", "_usersOfItems", "_bloodLossOnSelection"];
TRACE_6("params",_caller,_target,_selectionName,_className,_usersOfItems,_bloodLossOnSelection);

// Ensures comptibilty with other possible medical treatment configs
private _previousDamage = _bloodLossOnSelection;

// Exit if litter is disabled by setting
if !(EGVAR(medical,allowLitterCreation)) exitWith {};

// Don't create litter if medic or patient are inside a vehicle
if (vehicle _caller != _caller || {vehicle _target != _target}) exitWith {};

private _config = configFile >> QGVAR(Actions) >> _className;
if !(isClass _config) exitWith {TRACE_1("No action config",_className);};

if !(isArray (_config >> "litter")) exitWith {TRACE_1("No litter config",_className);};
private _litter = getArray (_config >> "litter");

private _createLitter = {
    params ["_unit", "_litterClass"];

    private _position = getPosASL _unit;

    // @TODO: handle carriers over water
    // For now, don't spawn litter if we are over water to avoid floating litter
    if (surfaceIsWater _position) exitWith {false};

    _position = _position vectorAdd [
        random 2 - 1,
        random 2 - 1,
        0
    ];

    private _direction = random 360;

    // Create the litter, and timeout the event based on the cleanup delay
    // The cleanup delay for events in MP is handled by the server side
    TRACE_3("Creating Litter on server",_litterClass,_position,_direction);
    [QGVAR(createLitterServer), [_litterClass, _position, _direction]] call CBA_fnc_serverEvent;

    true
};

{
    if (count _x < MIN_ENTRIES_LITTER_CONFIG) then {
        WARNING_2("Wrong litter array: %1",_x);
    } else {
        _x params [
            ["_selection", "", [""]],
            ["_litterCondition", "", [""]],
            ["_litterOptions", [], [[]]]
        ];

        if (toLower _selection in [toLower _selectionName, "all"]) then {
            if (_litterCondition isEqualTo "") then {
                _litterCondition = {true};
            } else {
                _litterCondition = compile _litterCondition;
            };

            // existing configs seem to use carried over magic variables. we pass them as arguments (_this) anyway
            if !([_caller, _target, _selectionName, _className, _usersOfItems, _bloodLossOnSelection] call _litterCondition) exitWith {};

            // Loop through through the litter options and place the litter
            {
                if (_x isEqualType "") then {
                    [_target, _x] call _createLitter;
                };

                if (_x isEqualType [] && {count _x > 0}) then {
                    [_target, selectRandom _x] call _createLitter;
                };
            } foreach _litterOptions;
        };
    };
} foreach _litter;
