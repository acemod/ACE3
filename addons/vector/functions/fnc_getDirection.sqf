/*
 * Author: commy2
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Array <ARRAY>
 *
 * Example:
 * call ace_vector_fnc_getDirection
 *
 * Public: No
 */

// by commy2
#include "script_component.hpp"

/*
private "_dlgVector";

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector, displayNull);

[
    round parseNumber ctrlText (_dlgVector displayCtrl 156),
    round parseNumber ctrlText (_dlgVector displayCtrl 182)
]
*/

#define MAX_ABSINCLINATION 45

private _position = ATLToASL positionCameraToWorld [0,0,0];
private _direction = ATLToASL positionCameraToWorld [0,0,1];

private _azimuth = ((_direction select 0) - (_position select 0)) atan2 ((_direction select 1) - (_position select 1));
private _inclination = asin ((_direction select 2) - (_position select 2));

if (_azimuth < 0) then {_azimuth = _azimuth + 360};
if (abs _inclination > MAX_ABSINCLINATION) then {_inclination = -1000};

[_azimuth, _inclination]
