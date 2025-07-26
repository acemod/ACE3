#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Gets the container associated with the given inventory display IDC.
 *
 * Arguments:
 * 0: Control IDC <NUMBER>
 *
 * Return Value:
 * Container <OBJECT>
 *
 * Public: No
 */
params ["_ctrlIDC"];

switch (_ctrlIDC) do {
    case IDC_GROUND_CONTAINER: {
        GVAR(openedContainers)#1
    };
    case IDC_SOLDIER_CONTAINER: {
        GVAR(openedContainers)#0
    };
    case IDC_UNIFORM_CONTAINER: {
        uniformContainer ACE_player
    };
    case IDC_VEST_CONTAINER: {
        vestContainer ACE_player
    };
    case IDC_BACKPACK_CONTAINER: {
        backpackContainer ACE_player
    };
    default {
        objNull
    };
};
