#include "../../script_component.hpp"

/*
* Author: Zorn
* This Function checks if the Target Item has an Alternative Picture for the Action, if not, it returns the picture property
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params [ ["_cfg", configNull, [configNull] ] ];

private _altDispIcon = getText (_cfg >> QADDON >> "alternativePicture");
if (_altDispIcon isEqualTo "") then { getText (_cfg >> "picture") } else { _altDispIcon }

