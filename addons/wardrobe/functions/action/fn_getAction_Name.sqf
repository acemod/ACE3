#include "../../script_component.hpp"

/*
* Author: Zorn
* This Function checks if the Target Item has an Alternative String for the Action, if not, it returns the displayName property
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

private _altDispName = getText (_cfg >> QADDON >> "alternativeDisplayName");
if (_altDispName isEqualTo "") then { getText (_cfg >> "displayName") } else { _altDispName };

