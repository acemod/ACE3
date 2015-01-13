/*
  Author: Pabst Mirror

  Description:
    Waits then deletes the object.  Fixes IR_Grenade's effect not disapearing.

  Parameters:
    0: ARRAY - [OBJECT - item, NUMBER - time to wait until]
    1: NUMBER - CBA's PerFrameHandler ID
*/

_attachedItem = (_this select 0) select 0;
_waitUntilTime = (_this select 0) select 1;

if (time < _waitUntilTime) exitWith {};

deleteVehicle _attachedItem;

//Remove the frame handler
[(_this select 1)] call cba_fnc_removePerFrameHandler;
