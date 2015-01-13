/**
 * fn_carryObj.sqf
 * @Descr: Have a unit carry an object. Use ObjNull for second parameter if you want the unit to carry nothing
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, objectToCarry OBJECT, attachToVector ARRAY (Optional)]
 * @Return: BOOL Returns true if succesful
 * @PublicAPI: true
 */

private ["_unit","_to","_return", "_fallDown", "_carriedObj", "_positionUnit"];
_unit = [_this, 0,ObjNull, [ObjNull]] call bis_fnc_param;
_to = [_this, 1,ObjNull, [ObjNull]] call bis_fnc_param;
_fallDown = false;
if (count _this > 3) then {
	_fallDown = _this select 3;
};
_return = false;

	[format["fnc_carryObj - UNIT: %1 ATTEMPTS TO CARRY %2",_unit,_to],2] call cse_fnc_debug;

	if (((typeName _to) == "OBJECT" && (isNull ([_unit] call cse_fnc_getCarriedObj))) || isNull _to) then {
		if (vehicle _unit != _unit) exitwith {};
		if (!isNull _to) then {
			if ((isNull ([_to] call cse_fnc_getCarriedObj)) && ([_unit] call cse_fnc_canInteract)) then {
				_return = true;
				_unit setvariable ["cse_carriedObj",_to,true];
				if (_fallDown) then {
				//	[_unit,_fallDown] call cse_fnc_limitMovementSpeed;
				};
				[_to, _unit] call cse_fnc_setCarriedBy;
				if (count _this > 2) then {
					if (count (_this select 2) == 3) then {
						_to attachTo [_unit,(_this select 2)];
						[format["fnc_carryObj - UNIT: %1 TO %2 - attachTo offset: %3",_unit,_to,(_this select 2)],2] call cse_fnc_debug;
					};
				} else {
					[format["fnc_carryObj - UNIT: %1 TO %2 - Script expects external handling of attachTo Command. Exiting",_unit,_to],2] call cse_fnc_debug;
				};

				[[_unit, _to, _fallDown],"carryObject"] call cse_fnc_customEventHandler_F;

			};
		} else {
			if (!isNull ([_unit] call cse_fnc_getCarriedObj)) then {
				[format["fnc_carryObj - UNIT: %1 DROPING CARRIED OBJECT",_unit],2] call cse_fnc_debug;
				_carriedObj = ([_unit] call cse_fnc_getCarriedObj);

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
				[[_unit, _carriedObj],"carryObjectDropped"] call cse_fnc_customEventHandler_F;

				[[_unit] call cse_fnc_getCarriedObj, objNull] call cse_fnc_setCarriedBy;
				_unit setvariable ["cse_carriedObj",_to,true];
				_return = true;

				[[_unit, _to, _fallDown],"carryObject"] call cse_fnc_customEventHandler_F;
			};
		};
	} else {
		[format["fnc_carryObj - UNIT: %1 FAILED TO CARRY %2 - not an object or already carrying",_unit,_to],2] call cse_fnc_debug;
	};

	//[format["UNIT: %1 ATTEMPTS TO CARRY %2",_unit,_to],2] call cse_fnc_debug;
_return
