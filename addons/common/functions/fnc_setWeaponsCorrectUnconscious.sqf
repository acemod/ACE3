/**
 * fn_setWeaponsCorrectUnconscious.sqf
 * @Descr: Ensures the weapon of a unit is selected correctly for the unconscious state. Prefents wierd animation behaviour
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit"];
_unit = _this select 0;

if ((vehicle _unit) isKindOf "StaticWeapon") then {
    moveOut _unit;
    unassignVehicle _unit;
    //unassignVehicle _unit;
    //_unit action ["eject", vehicle _unit];
};
if (vehicle _unit == _unit) then {
    if (currentWeapon _unit == secondaryWeapon _unit) then {
        reload _unit;
    };
};

if (animationState _unit in ["ladderriflestatic","laddercivilstatic"]) then {
    _unit action ["ladderOff", (nearestBuilding _unit)];
};

if (vehicle _unit == _unit) then {
    if (currentWeapon _unit == secondaryWeapon _unit) then {
        _unit selectWeapon (primaryWeapon _unit);
        _unit switchMove "";
        _unit playmoveNow "";
    };
};
