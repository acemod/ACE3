/*
 * Author: PabstMirror
 * Adapted from BIS_fnc_packStaticWeapon (Dean "Rocket" Hall, reworked by Killzone_Kid)
 * Packs up a static weapon into backpacks
 *
 * Arguments:
 * 0: Gunner (will carry weapon backpack, may or may not be inside static weapon) <OBJECT>
 * 1: Assistant (will carry tripod backpack) <OBJECT>
 * 2: Static Weapon <OBJECT>
 * 3: Module Placer Client ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [q1, q2, theGun, 2] call ace_zeus_fnc_moduleStaticWeaponTakeLocal
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_gunner", "_assistant", "_staticWeapon", "_callerID"];
TRACE_4("starting PFEH",_gunner,_assistant,_staticWeapon,_callerID);

if ((!local _gunner) || {!local _assistant}) exitWith {WARNING("Split locality");};

moveOut _gunner;
_gunner leaveVehicle _staticWeapon;
unassignVehicle _gunner;

[{
    params ["_args", "_pfID"];
    _args params ["_gunner", "_assistant", "_staticWeapon", "_callerID", "_state", "_gunnerReady", "_assistantReady"];

    if ((!alive _staticWeapon) ||
            {isNull _gunner} || {!([_gunner] call EFUNC(common,isAwake))} || {fleeing _gunner} ||
            {isNull _assistant} || {!([_assistant] call EFUNC(common,isAwake))} || {fleeing _assistant}) exitWith {
        TRACE_1("problem",_this);
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    switch (_state) do {
    case (0): {
            if ((vehicle _gunner) == _gunner) then {
                if ((backpack _gunner) != "") then {
                    TRACE_1("dropping extra bag",backpack _gunner);
                    _gunner action ["PutBag"];
                };
                if ((backpack _assistant) != "") then {
                    TRACE_1("dropping extra bag",backpack _assistant);
                    _assistant action ["PutBag"];
                };

                _args set [4, 1]
            };
        };
    case (1): {
            private _weaponPos = getPosATL _staticWeapon;
            TRACE_1("Moving near static",_weaponPos);
            private _gunnerPos = _staticWeapon getRelPos [1, -135];
            _gunnerPos set [2, _weaponPos select 2]; // -- keep z
            private _assistantPos = _staticWeapon getRelPos [1, 135];
            _assistantPos set [2, _weaponPos select 2]; // -- keep z

            _gunner setUnitPos "AUTO";
            _gunner doWatch _staticWeapon;
            _gunner doMove _gunnerPos;
            _assistant setUnitPos "AUTO";
            _assistant doWatch _staticWeapon;
            _assistant doMove _assistantPos;

            _args set [4, 2]
        };
    case (2): {
            if ((!_gunnerReady) && {unitReady _gunner}) then {
                TRACE_1("gunner in pos",_gunner distance _staticWeapon);
                doStop _gunner;
                _args set [5, true];
            };
            if ((!_assistantReady) && {unitReady _assistant}) then {
                TRACE_1("assistant in pos",_assistant distance _staticWeapon);
                doStop _assistant;
                _args set [6, true];
            };
            if (_gunnerReady && _assistantReady) then {
                _gunner setVariable [QGVAR(weaponDisassembled), nil];
                _gunner addEventHandler ["WeaponDisassembled", {
                    TRACE_1("WeaponDisassembled EH",_this);
                    (_this select 0) setVariable [QGVAR(weaponDisassembled), _this];
                }];
                _gunner action ["Disassemble", _staticWeapon];
                TRACE_1("Disassemble",_staticWeapon);
                _args set [4, 3]
            };
        };
    case (3): {
            if (!isNil {_gunner getVariable QGVAR(weaponDisassembled)}) then {
                (_gunner getVariable QGVAR(weaponDisassembled)) params ["", "_weaponBag", "_baseBag"];
                TRACE_2("",_weaponBag,_baseBag);
                private _leader = leader _gunner;

                _gunner action ["TakeBag", _weaponBag];
                _assistant action ["TakeBag", _baseBag];

                _gunner setUnitPos "AUTO";
                _gunner doWatch objNull;
                _gunner doFollow _leader;

                _assistant setUnitPos "AUTO";
                _assistant doWatch objNull;
                _assistant doFollow _leader;

                [_pfID] call CBA_fnc_removePerFrameHandler;
                TRACE_1("finished",_this);
            };
        };
    };
}, 0.1, [_gunner, _assistant, _staticWeapon, _callerID, 0, false, false]] call CBA_fnc_addPerFrameHandler;
