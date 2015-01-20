/**
 * fn_carryObj.sqf
 * @Descr: Have a unit carry an object. Use ObjNull for second parameter if you want the unit to carry nothing
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, objectToCarry OBJECT, attachToVector ARRAY (Optional)]
 * @Return: BOOL Returns true if succesful
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_to","_return", "_fallDown", "_carriedObj", "_positionUnit"];
_unit = [_this, 0,ObjNull, [ObjNull]] call bis_fnc_param;
_to = [_this, 1,ObjNull, [ObjNull]] call bis_fnc_param;
_fallDown = false;
if (count _this > 3) then {
    _fallDown = _this select 3;
};
_return = false;

[format["fnc_carryObj - UNIT: %1 ATTEMPTS TO CARRY %2",_unit,_to],2] call FUNC(debug);

if (((typeName _to) == "OBJECT" && (isNull ([_unit] call FUNC(getCarriedObj)))) || isNull _to) then {
    if (vehicle _unit != _unit) exitwith {};
    if (!isNull _to) then {
        if ((isNull ([_to] call FUNC(getCarriedObj))) && ([_unit] call FUNC(canInteract))) then {
            _return = true;
            _unit setvariable [QGVAR(carriedObj),_to,true];
            if (_fallDown) then {
            //    [_unit,_fallDown] call FUNC(limitMovementSpeed);
            };
            [_to, _unit] call FUNC(setCarriedBy);
            if (count _this > 2) then {
                if (count (_this select 2) == 3) then {
                    _to attachTo [_unit,(_this select 2)];
                    [format["fnc_carryObj - UNIT: %1 TO %2 - attachTo offset: %3",_unit,_to,(_this select 2)],2] call FUNC(debug);
                };
            };
           // ["carryObject", [_unit], [_unit, _to, _fallDown]] call EFUNC(common,targetEvent);
            ["carryObject", [_unit, _to, _fallDown]] call ace_common_fnc_localEvent;
        };
    } else {
        if (!isNull ([_unit] call FUNC(getCarriedObj))) then {
            [format["fnc_carryObj - UNIT: %1 DROPING CARRIED OBJECT",_unit],2] call FUNC(debug);
            _carriedObj = ([_unit] call FUNC(getCarriedObj));

            detach _carriedObj;
            //_carriedObj setPosATL [(getPosATL _carriedObj) select 0, (getPosATL _carriedObj) select 1,0];
            if (!surfaceIsWater getPos _unit) then {
                _positionUnit = getPosATL _carriedObj;
                _positionUnit set [2, ((getPosATL _unit) select 2) + 0.1];
                _carriedObj setPosATL _positionUnit;
            } else {
                _positionUnit = getPosASL _carriedObj;
                _positionUnit set [2, ((getPosASL _unit) select 2) + 0.1];
                _carriedObj setPosASL _positionUnit;
            };

            [[_unit] call FUNC(getCarriedObj), objNull] call FUNC(setCarriedBy);
            _unit setvariable [QGVAR(carriedObj),_to,true];
            _return = true;

           // ["carryObjectDropped", [_unit], [_unit, _to, _fallDown]] call EFUNC(common,targetEvent);
            ["carryObjectDropped", [_unit, _to, _fallDown]] call ace_common_fnc_localEvent;

        };
    };
} else {
    [format["fnc_carryObj - UNIT: %1 FAILED TO CARRY %2 - not an object or already carrying",_unit,_to],2] call FUNC(debug);
};
_return
