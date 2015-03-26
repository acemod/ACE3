/*
 * Author: commy2
 *
 * Called from init eventhandler. Checks if the vehicles class already has the actions initialized. Otherwise add all available repair options.
 *
 * Arguments:
 * 0: vehicle (Object)
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

private "_vehicle";

_vehicle = _this select 0;

private ["_type", "_initializedClasses"];

_type = typeOf _vehicle;

_initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

// get all hitpoints
private "_hitPoints";
_hitPoints = [_vehicle] call EFUNC(common,getHitPointsWithSelections) select 0;

// get hitpoints of wheels with their selections
private ["_wheelHitPointsWithSelections", "_wheelHitPoints", "_wheelHitPointSelections"];

_wheelHitPointsWithSelections = [_vehicle] call FUNC(getWheelHitPointsWithSelections);

_wheelHitPoints = _wheelHitPointsWithSelections select 0;
_wheelHitPointSelections = _wheelHitPointsWithSelections select 1;

// add repair events to this vehicle class
{
    if (_x in _wheelHitPoints) then {
        // add wheel repair action

        private ["_nameRemove", "_nameReplace", "_icon", "_selection"];

        _nameRemove = format ["Remove %1", _x];
        _nameReplace = format  ["Replace %1", _x];

        _icon = QUOTE(PATHTOF(ui\tire_ca.paa));

        _selection = _wheelHitPointSelections select (_wheelHitPoints find _x);

        private ["_statement_remove", "_condition_remove", "_statement_replace", "_condition_replace"];

        _statement_remove = format [QFUNC(removeWheel_%1), _x];
        _condition_remove = format [QFUNC(canRemoveWheel_%1), _x];
        _statement_replace = format [QFUNC(replaceWheel_%1), _x];
        _condition_replace = format [QFUNC(canReplaceWheel_%1), _x];

        // compile functions for that hitpoint if no such functions currently exist
        if (isNil _statement_remove) then {
            // remove wheel
            private "_function";
            _function = compile format [QUOTE([ARR_2(_target,'%1')] call DFUNC(removeWheel)), _x];

            missionNamespace setVariable [_statement_remove, _function];

            _function = compile format ["alive _target && {_target getHitPointDamage '%1' < 1}", _x];

            missionNamespace setVariable [_condition_remove, _function];

            // replace wheel
            _function = compile format [QUOTE([ARR_2(_target,'%1')] call DFUNC(replaceWheel)), _x];

            missionNamespace setVariable [_statement_replace, _function];

            _function = compile format ["alive _target && {_target getHitPointDamage '%1' >= 1}", _x];

            missionNamespace setVariable [_condition_replace, _function];
        };

        _statement_remove = missionNamespace getVariable [_statement_remove, {}];
        _condition_remove = missionNamespace getVariable [_condition_remove, {}];
        _statement_replace = missionNamespace getVariable [_statement_replace, {}];
        _condition_replace = missionNamespace getVariable [_condition_replace, {}];

        [_type, 0, [_nameRemove], [_nameRemove, _icon, _selection, _statement_remove, _condition_remove, 2]] call EFUNC(interact_menu,addActionToClass);
        [_type, 0, [_nameReplace], [_nameReplace, _icon, _selection, _statement_replace, _condition_replace, 2]] call EFUNC(interact_menu,addActionToClass);

    } else {
        // exit if the hitpoint is in the blacklist, e.g. glasses
        if (_x in IGNORED_HITPOINTS) exitWith {};

        // exit if the hitpoint is virtual
        if (isText (configFile >> "CfgVehicles" >> _type >> "HitPoints" >> _x >> "depends")) exitWith {};

        // add misc repair action

        private ["_name", "_icon", "_selection"];

        _name = format ["Repair %1", _x];

        _icon = "";

        _selection = "";

        private ["_statement", "_condition"];

        _statement = format [QFUNC(repair_%1), _x];
        _condition = format [QFUNC(canRepair_%1), _x];

        // compile functions for that hitpoint if no such functions currently exist
        if (isNil _statement) then {
            private "_function";
            _function = compile format [QUOTE([ARR_3(_player,_target,'%1')] call DFUNC(repairVehicle)), _x];

            missionNamespace setVariable [_statement, _function];

            _function = compile format ["alive _target && {_target getHitPointDamage '%1' > 0}", _x];

            missionNamespace setVariable [_condition, _function];
        };

        _statement = missionNamespace getVariable [_statement, {}];
        _condition = missionNamespace getVariable [_condition, {}];

        [_type, 0, ["ACE_MainActions", QGVAR(Repair), _name], [_name, _icon, _selection, _statement, _condition, 4]] call EFUNC(interact_menu,addActionToClass);

    };
} forEach _hitPoints;

// set class as initialized
_initializedClasses pushBack _type;

SETMVAR(GVAR(initializedClasses),_initializedClasses);
