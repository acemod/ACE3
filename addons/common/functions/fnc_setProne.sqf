/*
 * Author: Glowbal
 *
 * Force a unit to go prone
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [[_unit,ObjNull,[ObjNull]]];

switch (currentWeapon _unit) do {
    case (primaryWeapon _unit): {
        [_unit,"amovppnemstpsraswrfldnon"] call FUNC(localAnim);
    };
    case (secondaryWeapon _unit): {
        [_unit,"amovppnemstpsraswlnrdnon"] call FUNC(localAnim);
    };
    case (handgunWeapon _unit): {
         [_unit,"AmovPpneMstpSrasWpstDnon"] call FUNC(localAnim);
    };
    default {
        [_unit,"amovppnemstpsnonwnondnon"] call FUNC(localAnim);
    };
};
