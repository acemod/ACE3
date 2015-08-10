/*
 * Author: esteldunedain
 * Initializes the actions for turning on/off the laser for vehicles that have them
 *
 * Argument:
 * 0: Vehicle <OBJECT>
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

EXPLODE_1_PVT(_this,_vehicle);

// Add action to class if it is not already done
private ["_type", "_initializedClasses"];
_type = typeOf _vehicle;
_initializedClasses = GETGVAR(initializedClasses,[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};
_initializedClasses pushBack _type;
GVAR(initializedClasses) = _initializedClasses;

{
    private ["_turretConfig","_onAction","_offAction"];
    _turretConfig = [configFile >> "CfgVehicles" >> _type, _x] call EFUNC(common,getTurretConfigPath);

    if (getNumber (_turretConfig >> QGVAR(Enabled)) == 1) exitWith {
        // @todo: Add the state variables to the vehicle, instead of to the client
        // e.g.: _vehicle setVariable [format ["%1_%2", QGVAR(active),  _x], false];

        // Add actions
        _onAction = [QGVAR(LaserOn), localize LSTRING(DesignatorOn), "",
        {
            // Statement
            _this call FUNC(laserHudDesignateOn)
        },
        {
            // Condition
            !GVAR(active) && {[ACE_player] call FUNC(unitTurretHasDesignator)}
        }] call EFUNC(interact_menu,createAction);

        _offAction = [QGVAR(LaserOff), localize LSTRING(DesignatorOff), "",
        {
            // Statement
            _this call FUNC(laserHudDesignateOff)
        },
        {
            // Condition
            GVAR(active) && {[ACE_player] call FUNC(unitTurretHasDesignator)}
        }] call EFUNC(interact_menu,createAction);

        [_type, 1, ["ACE_SelfActions"], _onAction] call EFUNC(interact_menu,addActionToClass);
        [_type, 1, ["ACE_SelfActions"], _offAction] call EFUNC(interact_menu,addActionToClass);
    };
} forEach allTurrets _vehicle;
