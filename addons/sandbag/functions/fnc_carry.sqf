/*
 * Author: Ruthberg
 * Carry sandbag
 *
 * Arguments:
 * 0: sandbag <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_sandbag, _unit] call ace_sandbag_fnc_carry;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_sandbag,_unit);

_unit playActionNow "PutDown";

_unit setVariable [QGVAR(usingSandbag), true];
[{
    PARAMS_2(_sandbag,_unit);
    
    GVAR(carrier) = ACE_player;
    
    [GVAR(carrier), "ACE_Sandbag", true] call EFUNC(common,setForceWalkStatus);
    
    deleteVehicle _sandbag;
    
    GVAR(sandBag) = createVehicle ["ACE_SandbagObject_NoGeo", [0,0,0], [], 0, "NONE"];
    GVAR(sandBag) enableSimulationGlobal false;
    
    // Force physx update
    {
        _x setPosASL (getPosASL _x);
    } forEach (GVAR(carrier) nearObjects ["ACE_SandbagObject", 5]);

    GVAR(carryPFH) = [{
        if (GVAR(carrier) != ACE_player) exitWith {
            call FUNC(drop);
        };
        GVAR(sandBag) setPosASL ((eyePos ACE_player) vectorAdd (positionCameraToWorld [0,0,1] vectorDiff positionCameraToWorld [0,0,0]));
        GVAR(sandBag) setDir (GVAR(deployDirection) + getDir ACE_player);
    }, 0, []] call CBA_fnc_addPerFrameHandler;

    [localize LSTRING(DropSandbag), "", ""] call EFUNC(interaction,showMouseHint);

    GVAR(carrier) setVariable [QGVAR(drop),
        [GVAR(carrier), "DefaultAction",
        {GVAR(carryPFH) != -1 && !isNull (GVAR(sandBag))},
        {call FUNC(drop);}
    ] call EFUNC(common,AddActionEventHandler)];
}, [_sandbag, _unit], 1, 0.5] call EFUNC(common,waitAndExecute);
