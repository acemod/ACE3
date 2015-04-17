#include "script_component.hpp"

PARAMS_1(_defuseHelper);
//this seems to only fire on local, but just to be sure:
if (!local _defuseHelper) exitWith {};

_explosive = _defuseHelper getVariable [QGVAR(Explosive), objNull];
//Only explode if _explosive still exists and it took "lethal" damage
//So we know the ExplosionEH was triggered by the mine exploding
if ((isNull _explosive) || {(damage _explosive) < 1}) exitWith {};

//Only do stuff it's a trip flare
if (typeOf _explosive != "ACE_APERSTripFlare_Wire_Ammo") exitWith {};

systemChat format ["Flare Triggered: [%1] from [%2]", _defuseHelper, _explosive];

_flare = "ACE_TripFlare_FlareEffect" createVehicle (getpos _defuseHelper);
_flare attachTo [_defuseHelper, [2,0,0]];