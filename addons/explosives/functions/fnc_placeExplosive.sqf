#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Places an explosive at the requested position.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Position ATL to place explosive <ARRAY> (default: [0, 0, 0])
 * 2: Rotation <NUMBER> (default: 0)
 * 3: Magazine class <STRING> (default: "")
 * 4: Config of trigger <STRING> (default: "")
 * 5: Variables required for the trigger type <ARRAY> (default: [])
 * 6: Explosive placeholder <OBJECT> (default: objNull)
 *
 * Return Value:
 * Placed explosive <OBJECT>
 *
 * Example:
 * [player, player modelToWorldVisual [0, 0.5, 0.1], 134, "SatchelCharge_Remote_Mag", "Command", []] call ace_explosives_fnc_placeExplosive
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_pos", [0, 0, 0], [[]], 3],
    ["_dir", 0, [0]],
    ["_magazineClass", "", [""]],
    ["_triggerConfig", "", [""]],
    ["_triggerSpecificVars", [], [[]]],
    ["_setupPlaceholderObject", objNull, [objNull]]
];
TRACE_7("params",_unit,_pos,_dir,_magazineClass,_triggerConfig,_triggerSpecificVars,_setupPlaceholderObject);

[_unit, "PutDown"] call EFUNC(common,doGesture);

private _attachedTo = objNull;

if (!isNull _setupPlaceholderObject) then {
    _attachedTo = attachedTo _setupPlaceholderObject;
    deleteVehicle _setupPlaceholderObject;
};

if (_triggerConfig == "") exitWith {
    ERROR_1("Config not passed to PlaceExplosive: %1",_this);

    objNull // return
};

private _magazineTrigger = configFile >> "CfgMagazines" >> _magazineClass >> "ACE_Triggers" >> _triggerConfig;
_triggerConfig = configFile >> "ACE_Triggers" >> _triggerConfig;

if (isNull _triggerConfig) exitWith {
    ERROR_1("Config not found in PlaceExplosive: %1",_this);

    objNull // return
};

private _ammo = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");

if (isText (_magazineTrigger >> "ammo")) then {
    _ammo = getText (_magazineTrigger >> "ammo");
};

_triggerSpecificVars pushBack _triggerConfig;

// Dig the explosive down into the ground (usually on "pressurePlate")
if (isNumber (_magazineTrigger >> "digDistance")) then {
    private _digDistance = getNumber (_magazineTrigger >> "digDistance");

    // If dig distance is negative (=> placed closer towards the sky), ignore digging requirements
    private _canDigDown = if (_digDistance >= 0) then {
        [_pos] call EFUNC(common,canDig)
    } else {
        true
    };

    // Don't dig down if pos ATL is high (in a building or A2 road)
    if (_canDigDown && {(_pos select 2) < 0.1}) then {
        TRACE_2("Can Dig Down",_digDistance,_pos);

        _pos = _pos vectorAdd [0, 0, -_digDistance];
    } else {
        TRACE_2("Can NOT Dig Down",_digDistance,_pos);
    };
};

private _explosive = _ammo createVehicle [0, 0, 0];
_explosive setPosATL _pos;

if (!isNull _attachedTo) then {
    TRACE_1("Attaching Live Explosive",_attachedTo);

    _explosive attachTo [_attachedTo];
};

// If trigger has "onPlace" and it returns true, just exitWith the explosive
if (isText (_triggerConfig >> "onPlace") && {[_unit, _explosive, _magazineClass, _triggerSpecificVars] call compile (getText (_triggerConfig >> "onPlace"))}) exitWith {
    TRACE_1("onPlace returns true",_explosive);

    _explosive // return
};

// TODO: placing explosives on hills looks funny
private _pitch = getNumber (_magazineTrigger >> "pitch");

// Globally set the position and angle
[QGVAR(place), [_explosive, _dir, _pitch, _unit]] call CBA_fnc_globalEvent;

_explosive // return
