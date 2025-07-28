#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to return the data index based of the magazine ID.
 *
 * Arguments:
 * 0: Magazine ID <STRING>
 *
 * Return Value:
 * Index <NUMBER>
 *
 * Example:
 * toFixed 0;
 * private _magazineDetails = (magazinesAmmoFull player) apply { [_x#0, _x#-2, _x#-1] };
 * private _documents = _magazineDetails findIf { _x select 0 == "acex_intelitems_document" } > -1;
 * if (_documents) then { _documents = [player, "acex_intelitems_document"] call CBA_fnc_getMagazineIndex apply { _x call ace_wardrobe_fnc_getIndexFromMagID } };
 *
 * Public: No
 */

params [["_magazineID", "", [""]]];

if !(_magazineID in allVariables EGVAR(intelItems,intelMap)) exitWith { -1 };

EGVAR(intelItems,intelMap) getVariable _magazineID
