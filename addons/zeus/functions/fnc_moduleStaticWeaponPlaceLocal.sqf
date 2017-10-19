/*
 * Author: PabstMirror
 * Adapted from BIS_fnc_packStaticWeapon (Dean "Rocket" Hall, reworked by Killzone_Kid)
 * Place on a unit in a static weapon to make them dissasemble and pickup the backpacks parts
 *
 * Arguments:
 * 0: Gunner (carrying the weapon backpack) <OBJECT>
 * 1: Watch Direction <ARRAY>
 * 2: Module Placer Client ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [q1, [0,0,0], 2] call ace_zeus_fnc_moduleStaticWeaponPlaceLocal
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_gunner", "_watchPosASL", "_callerID"];
TRACE_3("moduleStaticWeaponPlaceLocal",_gunner,_watchPosASL,_callerID);

if ((!alive _gunner) || {!local _gunner}) exitWith {};
private _cfgBase = configFile >> "CfgVehicles" >> (backpack _gunner) >> "assembleInfo" >> "base";
private _compatibleBases = if (isText _cfgBase) then {[getText _cfgBase]} else {getArray _cfgBase};

private _availableUnits = (units group _gunner) select {(!isNull _x) && {_gunner != _x} && {[_x] call EFUNC(common,isAwake)} && {(vehicle _x) == _x}};
private _assistant = objNull;
{
    private _unit = _x;
    if (({(unitBackpack _unit) isKindOf _x} count _compatibleBases) > 0) exitWith {_assistant = _x};
} forEach _availableUnits;
TRACE_2("",_gunner,_assistant);
if (!local _assistant) exitWith {WARNING("Split locality");};

doStop _gunner;
_gunner doWatch (ASLtoATL _watchPosASL);
_gunner setUnitPos "MIDDLE";

_assistant doMove (getPosATL _gunner);


[{
    params ["_args", "_pfID"];
    _args params ["_gunner", "_assistant", "_callerID", "_state"];

    if ((isNull _gunner) || {!([_gunner] call EFUNC(common,isAwake))} || {fleeing _gunner} ||
            {isNull _assistant} || {!([_assistant] call EFUNC(common,isAwake))} || {fleeing _assistant}) exitWith {
        TRACE_1("problem",_this);
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    switch (_state) do {
    case (0): {
            if (unitReady _assistant) then {
                TRACE_1("assistant in pos",_assistant distance _staticWeapon);
                doStop _assistant;
                _assistant doWatch (ASLtoATL _watchPosASL);

                _gunner setVariable [QGVAR(weaponAssembled), nil];
                _gunner addEventHandler ["WeaponAssembled", {
                    TRACE_1("WeaponAssembled EH",_this);
                    (_this select 0) setVariable [QGVAR(weaponAssembled), _this];
                }];
                private _weaponBase = unitBackpack _assistant;
                _assistant action ["PutBag", _assistant];
                _gunner action ["Assemble", _weaponBase];
                TRACE_2("Assemble",typeOf _weaponBase,unitBackpack _gunner);
                _args set [3, 1]
            };
        };
    case (1): {
            if (!isNil {_gunner getVariable QGVAR(weaponAssembled)}) then {
                (_gunner getVariable QGVAR(weaponAssembled)) params ["_gunner", "_staticWeapon"];
                TRACE_2("",_gunner,_staticWeapon);


                _staticWeapon setDir (_staticWeapon getDir _watchPosASL);
                _weapon setPosATL getPosATL _gunner;

                _gunner assignAsGunner _staticWeapon;
                _gunner moveInGunner _staticWeapon;
                _gunner doWatch (ASLtoATL _watchPosASL);

                [_pfID] call CBA_fnc_removePerFrameHandler;
                TRACE_1("finished",_this);
            };
        };
    };
}, 0.1, [_gunner, _assistant, _callerID, 0]] call CBA_fnc_addPerFrameHandler;
