/*
 * Author: Nathan (Modified from fnc_treatmentBasic_Bandage and morphine)
 * Handles the Biofoam of a patient.
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_selectionName"];
// Ensure it is a valid bodypart

_target setHitPointDamage ["hitHead", 0];
_target setHitPointDamage ["hitBody", 0];
_target setHitPointDamage ["hitHands", 0];
_target setHitPointDamage ["hitLegs", 0];
_target setvariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0]];
{
    _target setHitPointDamage [_x, 0];
}foreach (missionNamespace getVariable "ACE_medical_Hitpoints");

_target setVariable [QEGVAR(medical,morphine), 0, true];
_target setVariable [QEGVAR(medical,pain), 0, true];

true;
