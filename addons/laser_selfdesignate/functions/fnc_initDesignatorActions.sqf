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

{
    private ["_turretConfig","_onAction","_offAction"];
    _turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _x] call EFUNC(common,getTurretConfigPath);

    if (getNumber (_turretConfig >> QGVAR(Enabled)) == 1) exitWith {
        // @todo: Add the state variables to the vehicle, instead of to the client
        // e.g.: _vehicle setVariable [format ["%1_%2", QGVAR(laserActive),  _x], false];

        // Add actions
        _onAction = [QGVAR(LaserOn), localize "STR_ACE_Laser_SelfDesignate_DesignatorOn", "",
        {
            // Statement
            _this call FUNC(laserHudDesignateOn)
        },
        {
            // Condition
            !GVAR(laserActive) && {[ACE_player] call FUNC(unitTurretHasDesignator)}
        }] call EFUNC(interact_menu,createAction);

        _offAction = [QGVAR(LaserOff), localize "STR_ACE_Laser_SelfDesignate_DesignatorOff", "",
        {
            // Statement
            _this call FUNC(laserHudDesignateOff)
        },
        {
            // Condition
            GVAR(laserActive) && {[ACE_player] call FUNC(unitTurretHasDesignator)}
        }] call EFUNC(interact_menu,createAction);

        [typeOf _vehicle, 1, ["ACE_SelfActions"], _onAction] call EFUNC(interact_menu,addActionToClass);
        [typeOf _vehicle, 1, ["ACE_SelfActions"], _offAction] call EFUNC(interact_menu,addActionToClass);
    };
} forEach allTurrets _vehicle;
