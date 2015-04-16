#include "script_component.hpp"

EXPLODE_4_PVT(_this,_unit,_explosive,_magazineClass,_extra);

_list = attachedObjects _explosive;

if ((count _list) != 1) exitWith {ERROR("attachedObjects count wrong");};

_defuseHelper = _list select 0;

_defuseHelper addEventHandler ["Explosion", {
    PARAMS_1(_defuseHelper);
    _explosive = _defuseHelper getVariable [QGVAR(Explosive), objNull];

    //Only explode if _explosive still exists and it took "lethal" damage
    //So we know the ExplosionEH was triggered by the mine exploding
    if ((isNull _explosive) || {(damage _explosive) < 1}) exitWith {};

    _flare = "ACE_TripFlare_FlareEffect" createVehicle (getpos _defuseHelper);
    _flare attachTo [_defuseHelper, [-2,0,0]];

}];
