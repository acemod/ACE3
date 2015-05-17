/*
 * Author: Garth de Wet (LH)
 * Prepares the select menu for use
 *
 * Arguments:
 * 0: Header Text <STRING>
 * 1: Approve Button Text <STRING>
 *
 * Return value:
 * Container object <NUMBER>
 *
 * Example:
 * array = ["Select Explosive", "Place"] call ace_interaction_fnc_prepareSelectMenu
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_header,_buttonText);

closeDialog 0;

if (isNil "_buttonText" or {_buttonText == ""}) then {
    _buttonText = localize "STR_ACE_Interaction_MakeSelection";
};

createDialog "RscACE_SelectAnItem";
ctrlSetText [8860, _buttonText];
ctrlSetText [8870, _header];

lbClear 8866;

8866
