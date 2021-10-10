#include "script_component.hpp"
/*
 * Author: commy2
 *
 * End radio transmissions of addons TFAR and ACRE2. TFAR v0.9.x, ACRE Public Beta 2.0.3.571, TFAR v1.0.-1.x
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_common_fnc_endRadioTransmission
 *
 * Public: No
 */

["ace_endRadioTransmissions"] call CBA_fnc_localEvent;

// ACRE
if (isClass (configFile >> "CfgPatches" >> "acre_main")) then {
    [-1] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
    [0] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
    [1] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
    [2] call acre_sys_core_fnc_handleMultiPttKeyPressUp;
};

// TFAR
if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
    if (isClass (configFile >> "CfgPatches" >> "tfar_core")) exitWith { // Beta TFAR, exit to avoid script errors from legacy functions not existing
        ACE_Player call TFAR_fnc_releaseAllTangents;
    };
    call TFAR_fnc_onSwTangentReleased;
    call TFAR_fnc_onAdditionalSwTangentReleased;
    call TFAR_fnc_onLRTangentReleased;
    call TFAR_fnc_onAdditionalLRTangentReleased;
    call TFAR_fnc_onDDTangentReleased;
};
