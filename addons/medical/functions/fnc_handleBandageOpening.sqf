/**
 * fn_handleBandageOpening.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define CFG_DEFAULT_WAITING_TIME 900 + random(120)
#define WAITINGTIME 1
#define RATIO 2
#define CHANCE 3

private ["_person","_amount","_bodyPart","_woundClass","_item","_config","_found", "_waitingTime", "_selectedConfig"];
_person = _this select 0;
_amount = _this select 1;
_bodyPart = _this select 2;
_woundClass = _this select 3;
_item = _this select 4;

// classname, waiting time until wound opens, ratio in which it start bleeding again, chance of the wound ever opening up //
_config = [
    ["ACE_bandage_basic", 900 + random (120), 0.75, 0.4],
    ["ACE_packing_bandage", 1200 + random (120), 0.5, 0.6],
    ["ACE_bandageElastic", 900 + random (900), 0.75, 0.2],
    ["ACE_quikclot", 1, 0.1, 0],
    ["default", 1, CFG_DEFAULT_WAITING_TIME, 1]
];
_selectedConfig = _config select (count _config - 1);
_waitingTime = -1;

_found = false;
{
    if (_item == _x select 0) exitwith {
        _found = true;
        if (random(1)> (1 - (_x select CHANCE))) then {

            _waitingTime = (_x select WAITINGTIME);
            _selectedConfig = _x;
        };
    };
}foreach _config;

if (!_found && (random(1)>0.2)) then {
    _waitingTime = CFG_DEFAULT_WAITING_TIME;
};

if (_waitingTime > 0) then {
    [{
        private ["_params", "_config", "_person", "_amount","_bodyPart","_woundClass","_item", "_bandagedWounds","_bandagedBodyPart","_bandagedWoundClass","_openWounds", "_openWoundsBodyPart","_openWoundClass"];
        _params = _this  select 0;
        _config = _this select 1;

        _person = _params select 0;
        _amount = _params select 1;
        _bodyPart = _params select 2;
        _woundClass = _params select 3;
        _item = _params select 4;

        _bandagedWounds = [_person,QGVAR(bandagedWounds)] call EFUNC(common,getDefinedVariable);
        _bandagedBodyPart = _bandagedWounds select _bodyPart;
        _bandagedWoundClass = _bandagedBodyPart select _woundClass;
        if (_bandagedWoundClass >= _amount) then {
            _openWounds =[_person,QGVAR(openWounds)] call EFUNC(common,getDefinedVariable);
            _openWoundsBodyPart = _openWounds select _bodyPart;
            _openWoundClass = _openWoundsBodyPart select _woundClass;

            _bandagedBodyPart set [_woundClass,_bandagedWoundClass - (_amount * (_config select RATIO))];
            _openWoundsBodyPart set [_woundClass,_openWoundClass + (_amount * (_config select RATIO))];

            _bandagedWounds set[_bodyPart,_bandagedBodyPart];
            _openWounds set[_bodyPart,_openWoundsBodyPart];
            [_person,QGVAR(openWounds),_openWounds] call EFUNC(common,setDefinedVariable);
            [_person,QGVAR(bandagedWounds),_bandagedWounds] call EFUNC(common,setDefinedVariable);

            ["Medical_onWoundsReopened", [_person, (_amount * (_config select RATIO)), _bodyPart, _woundClass, _item]] call ace_common_fnc_localEvent;
        };
    }, [_this, _selectedConfig], _waitingTime, _waitingTime] call EFUNC(common,waitAndExecute);
};