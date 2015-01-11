/*
 * Author: PabstMirror
 *
 * Returns the position of the object, OR he position of the transport in case the object is loaded into cargo.
 *
 * Argument:
 * 0: Any object (Object)
 *
 * Return value:
 * Position of the object or transport (Position 3D).
 */

private "_theCrate";

_theCrate = _this select 0;
{
	if (_theCrate in (_x getVariable ["AGM_Logistics_loadedItems", []])) exitWith {
		_theCrate = _x;
	};
} forEach vehicles;

getPos _theCrate
