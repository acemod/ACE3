/*
 * Author: GitHawk
 * Take a fuel nozzle either from a fuel truck/station or from the ground.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source or Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_refuel_fnc_takeNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_object", objNull, [objNull]]
];

[
    TIME_PROGRESSBAR(REFUEL_PROGRESS_DURATION),
    [_unit, _object],
    {
        params ["_args"];
        _args params ["_unit", "_object"];

        if !([_unit, _object] call FUNC(canTakeNozzle)) exitWith {};

        private _source = _object;
        private _nozzle = _object;
        if (typeOf _object isEqualTo QGVAR(fuelNozzle) || {_object getVariable [QGVAR(jerryCan), false]}) then { // func is called on muzzle either connected or on ground
            _source = _nozzle getVariable QGVAR(source);
            if (_nozzle getVariable [QGVAR(jerryCan), false]) then {
                _nozzle attachTo [_unit, [0,1,0], "pelvis"];
            } else {
                _nozzle attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];
            };
        } else { // func is called on fuel truck
            _nozzle = QGVAR(fuelNozzle) createVehicle [0,0,0];
            _nozzle attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];

            private _ropeTarget = _source;
            if !(_source isKindOf "AllVehicles") then {
                private _helper = QGVAR(helper) createVehicle [0,0,0];
                [QEGVAR(common,hideObjectGlobal), [_helper, true]] call CBA_fnc_serverEvent;
                if ((getText (configFile >> "CfgVehicles" >> typeOf _source >> "simulation")) isEqualTo "thingX") then {
                    _helper attachTo [_source, [0,0,0]];
                } else {
                    _helper setPosWorld (getPosWorld _source);
                    _helper setDir (getDir _source);
                    _helper setVectorUp (vectorUp _source);
                };
                _nozzle setVariable [QGVAR(helper), _helper, true];
                _ropeTarget = _helper;
            };
            private _attachPos = _source getVariable [QGVAR(hooks), getArray (configFile >> "CfgVehicles" >> typeOf _source >> QGVAR(hooks))];
            if (_attachPos isEqualTo []) then {
                _attachPos = [[0,0,0]];
            };
            if (count _attachPos == 1) then {
                _attachPos = _attachPos select 0;
            } else {
                // select closest hook
                private _hookDistances = _attachPos apply {_unit distance (_source modelToWorld _x)};
                _attachPos = _attachPos select (_hookDistances find selectMin _hookDistances);
            };
            private _hoseLength = _source getVariable [QGVAR(hoseLength), GVAR(hoseLength)];
            private _rope = ropeCreate [_ropeTarget, _attachPos, _nozzle, [0, -0.20, 0.12], _hoseLength];
            _nozzle setVariable [QGVAR(rope), _rope, true];
            _nozzle setVariable [QGVAR(attachPos), _attachPos, true];
            _nozzle setVariable [QGVAR(source), _source, true];

            [_source, "blockEngine", "ACE_Refuel", true] call EFUNC(common,statusEffect_set);
            _source setVariable [QGVAR(isConnected), true, true];
            _source setVariable [QGVAR(ownedNozzle), _nozzle, true];
        };

        _unit setVariable [QGVAR(nozzle), _nozzle, true];
        _unit setVariable [QGVAR(isRefueling), true];

        // holster weapon
        _unit setVariable [QGVAR(selectedWeaponOnRefuel), currentWeapon _unit];
        _unit call EFUNC(common,fixLoweredRifleAnimation);
        _unit action ["SwitchWeapon", _unit, _unit, 299];

        [_unit, "forceWalk", "ACE_refuel", true] call EFUNC(common,statusEffect_set);
        [_unit, "blockThrow", "ACE_refuel", true] call EFUNC(common,statusEffect_set);

        [_unit, _nozzle] call FUNC(startNozzleInHandsPFH);
    },
    {},
    localize LSTRING(TakeNozzleAction),
    {true},
    [INTERACT_EXCEPTIONS_REFUELING]
] call EFUNC(common,progressBar);
