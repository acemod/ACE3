#include "script_component.hpp"

PARAMS_1(_defuseHelper);
//this seems to only fire on local, but just to be sure:
if (!local _defuseHelper) exitWith {};

systemChat format ["Event [%1] = [%2]", _defuseHelper, (local _defuseHelper)];
_explosive = _defuseHelper getVariable [QGVAR(Explosive), objNull];
//Only explode if _explosive still exists and it took "lethal" damage
//So we know the ExplosionEH was triggered by the mine exploding
if ((isNull _explosive) || {(damage _explosive) < 1}) exitWith {};
_flare = "ACE_TripFlare_FlareEffect" createVehicle (getpos _defuseHelper);
_flare attachTo [_defuseHelper, [-2,0,0]];