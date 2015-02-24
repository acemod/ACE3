#include "script_component.hpp"

PARAMS_3(_helicopter,_reduc,_cargo);

/* Would be nice to have the rope animated in such way, that the slingrope between cargo and helicopter changes in length/look etc.
// Set heliocopter higher to align attached load with ground level
_z_cargo = getPosASL _cargo;
_z_helicopter = getPosASL _helicopter;
_z_diff = (_z_helicopter select 2) - (_z_cargo select 2);
_helicopter setPosASL [(_z_helicopter select 0),(_z_helicopter select 1), (_z_helicopter select 2) + _z_diff];
*/

// TODO: Local ?
if (local driver _helicopter) then {
	while {(_helicopter getvariable QGVAR(isTransporting)) && {canmove _helicopter} && {alive _helicopter} && {alive driver _helicopter}} do {
		_helicopter setvelocity [
			((velocity _helicopter) select 0)/_reduc,
			((velocity _helicopter) select 1)/_reduc,
			((velocity _helicopter) select 2)
		];
		// TODO: Track damage of cargo and helicopter = Cargo can be shot from slingload
		// TODO: Cargo collision
		// TODO: Landing event

		sleep 0.05;
	};
};
