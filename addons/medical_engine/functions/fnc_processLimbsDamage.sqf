#include "script_component.hpp"
/*
 * Author:gandjustas
 * Distributes damage from vanilla limb hitpoints to ACE limb hitpoints
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Hitpoint damage array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
 
params ["_unit", "_damages"];
_damages params ((_unit getVariable QEGVAR(medical,HitPoints)) apply { ["_" + _x,0] });

private _aceHitArms = _hitleftarm + _hitrightarm;
if (_aceHitArms > 0) then {
    private _hit = (_hitarms max _hithands);
    _damages set [_unit getVariable "hitleftarmIdx",  if (_hit == 0) then {nil} else { _hit * _hitleftarm  / _aceHitArms }];
    _damages set [_unit getVariable "hitrightarmIdx", if (_hit == 0) then {nil} else { _hit * _hitrightarm / _aceHitArms }];
};

private _aceHitLegs = _hitleftleg + _hitrightleg;
if (_aceHitLegs > 0) then {
    private _hit = _hitlegs;
    _damages set [_unit getVariable "hitleftlegIdx",  if (_hit == 0) then {nil} else { _hit * _hitleftleg  / _aceHitLegs }];
    _damages set [_unit getVariable "hitrightlegIdx", if (_hit == 0) then {nil} else { _hit * _hitrightleg / _aceHitLegs }];
};
