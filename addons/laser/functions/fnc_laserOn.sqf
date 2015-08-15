/*
 * Author: Nou
 * Turn a laser designator on.
 *
 * Arguments:
 * 0: Emitter <OBJECT>
 * 1: Owner <OBJECT>
 * 2: Method, can be code, which emitter and owner are passed to, a string function name, an array with a position memory point and weapon name, or an array with a position memory point, a vector begining memory point, and vector ending memory point. <?>
 * 3: Wavelength (1550nm is common eye safe) <NUMBER>
 * 4: Laser code <NUMBER>
 * 5: Beam divergence (in mils off beam center). <?>
 *
 * Return Value:
 * String, UUID for sending to laserOff function. <?>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_uuid", "_args"];
_uuid = format["%1%2%3", floor ACE_diagTime, floor random 1000, floor random 10000];
_args = [_uuid, _this];
["laser_laserOn", _args] call EFUNC(common,globalEvent);
_uuid;
