/*
 * Author: Garth 'L-H' de Wet
 * Places an explosive at the requested position
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Position to place explosive <POSITION>
 * 2: Rotation <NUMBER>
 * 3: Magazine class <STRING>
 * 4: Config of trigger <STRING>
 * 5: Variables required for the trigger type <ARRAY>
 * 6: Explosive placeholder <OBJECT> <OPTIONAL>
 *
 * Return Value:
 * Placed explosive <OBJECT>
 *
 * Example:
 * _explosive = [player, player modelToWorldVisual [0,0.5, 0.1], 134,
 *  "SatchelCharge_Remote_Mag", "Command", []] call ACE_Explosives_fnc_placeExplosive;
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_ammo", "_explosive", "_attachedTo", "_expPos", "_magazineTrigger"];
EXPLODE_6_PVT(_this,_unit,_pos,_dir,_magazineClass,_triggerConfig,_triggerSpecificVars);
DEFAULT_PARAM(6,_setupPlaceholderObject,objNull);

_unit playActionNow "PutDown";

_attachedTo = objNull;
if (!isNull _setupPlaceholderObject) then {
    _attachedTo = attachedTo _setupPlaceholderObject;
    deleteVehicle _setupPlaceholderObject;
};

if (isNil "_triggerConfig") exitWith {
    diag_log format ["ACE_Explosives: Error config not passed to PlaceExplosive: %1", _this];
    objNull
};

_magazineTrigger = ConfigFile >> "CfgMagazines" >> _magazineClass >> "ACE_Triggers" >> _triggerConfig;
_triggerConfig = ConfigFile >> "ACE_Triggers" >> _triggerConfig;

if (isNil "_triggerConfig") exitWith {
    diag_log format ["ACE_Explosives: Error config not found in PlaceExplosive: %1", _this];
    objNull
};

_ammo = getText(ConfigFile >> "CfgMagazines" >> _magazineClass >> "ammo");
if (isText(_magazineTrigger >> "ammo")) then {
    _ammo = getText (_magazineTrigger >> "ammo");
};
_triggerSpecificVars pushBack _triggerConfig;

_explosive = createVehicle [_ammo, _pos, [], 0, "NONE"];
_explosive setPosATL _pos;

["explosive_placed", [_explosive]] call EFUNC(common,globalEvent);

if (!isNull _attachedTo) then {
    TRACE_1("Attaching Live Explosive",_attachedTo);
    _explosive attachTo [_attachedTo];
};

if (isText(_triggerConfig >> "onPlace") && {[_unit,_explosive,_magazineClass,_triggerSpecificVars]
    call compile (getText (_triggerConfig >> "onPlace"))}) exitWith {_explosive};
[[_explosive, _dir, getNumber (_magazineTrigger >> "pitch")], QFUNC(setPosition)] call EFUNC(common,execRemoteFnc);
_explosive
