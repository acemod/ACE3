/*
 * Author: Garth 'L-H' de Wet
 * Places an explosive at the requested position.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Position to place explosive <POSITION>
 * 2: Rotation <NUMBER>
 * 3: Magazine class <STRING>
 * 4: Config of trigger <STRING>
 * 5: Variables required for the trigger type <ARRAY>
 * 6: Explosive placeholder <OBJECT> (default: objNull)
 *
 * Return Value:
 * Placed explosive <OBJECT>
 *
 * Example:
 * _explosive = [player, player modelToWorldVisual [0,0.5, 0.1], 134, "SatchelCharge_Remote_Mag", "Command", []] call ace_explosives_fnc_placeExplosive
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_pos", "_dir", "_magazineClass", "_triggerConfig", "_triggerSpecificVars", ["_setupPlaceholderObject", objNull]];
TRACE_7("params",_unit,_pos,_dir,_magazineClass,_triggerConfig,_triggerSpecificVars,_setupPlaceholderObject);

[_unit, "PutDown"] call EFUNC(common,doGesture);

private _attachedTo = objNull;
if (!isNull _setupPlaceholderObject) then {
    _attachedTo = attachedTo _setupPlaceholderObject;
    deleteVehicle _setupPlaceholderObject;
};

if (isNil "_triggerConfig") exitWith {
    ERROR_1("Config not passed to PlaceExplosive: %1",_this);
    objNull
};

private _magazineTrigger = ConfigFile >> "CfgMagazines" >> _magazineClass >> "ACE_Triggers" >> _triggerConfig;
_triggerConfig = ConfigFile >> "ACE_Triggers" >> _triggerConfig;

if (isNil "_triggerConfig") exitWith {
    ERROR_1("Config not found in PlaceExplosive: %1",_this);
    objNull
};

private _ammo = getText(ConfigFile >> "CfgMagazines" >> _magazineClass >> "ammo");
if (isText(_magazineTrigger >> "ammo")) then {
    _ammo = getText (_magazineTrigger >> "ammo");
};
_triggerSpecificVars pushBack _triggerConfig;

//Dig the explosive down into the ground (usually on "pressurePlate")
if (isNumber (_magazineTrigger >> "digDistance")) then {
    private _digDistance = getNumber (_magazineTrigger >> "digDistance");

    //Get Surface Type:
    private _canDigDown = true;
    private _surfaceType = surfaceType _pos;
    if ((_surfaceType select [0,1]) == "#") then {_surfaceType = _surfaceType select [1, 99];};
    if ((_surfaceType != "") || {isClass (configFile >> "CfgSurfaces" >> _surfaceType >> "soundEnviron")}) then {
        private _soundEnviron = getText (configFile >> "CfgSurfaces" >> _surfaceType >> "soundEnviron");
        TRACE_2("Dig Down Surface",_surfaceType,_soundEnviron);
        _canDigDown = !(_soundEnviron in ["road", "tarmac", "concrete", "concrete_int", "int_concrete", "concrete_ext"]);
    };
    //Don't dig down if pos ATL is high (in a building or A2 road)
    if (_canDigDown && {(_pos select 2) < 0.1}) then {
        TRACE_2("Can Dig Down",_digDistance,_pos);
        _pos = _pos vectorAdd [0,0, (-1 * _digDistance)];
    } else {
        TRACE_2("Can NOT Dig Down",_digDistance,_pos);
    };
};

private _explosive = createVehicle [_ammo, _pos, [], 0, "NONE"];
_explosive setPosATL _pos;

if (!isNull _attachedTo) then {
    TRACE_1("Attaching Live Explosive",_attachedTo);
    _explosive attachTo [_attachedTo];
};

//If trigger has "onPlace" and it returns true, just exitWith the explosive
if (isText(_triggerConfig >> "onPlace") && {[_unit,_explosive,_magazineClass,_triggerSpecificVars] call compile (getText (_triggerConfig >> "onPlace"))}) exitWith {
    TRACE_1("onPlace returns true",_explosive);
    _explosive
};

//TODO: placing explosives on hills looks funny

private _pitch = getNumber (_magazineTrigger >> "pitch");

//Globaly set the position and angle:
[QGVAR(place), [_explosive, _dir, _pitch, _unit]] call CBA_fnc_globalEvent;

_explosive
