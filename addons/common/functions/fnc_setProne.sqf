/**
 * fn_setProne.sqf
 * @Descr: Force a unit to go prone
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit"];
_unit = param [0,ObjNull,[ObjNull]];

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