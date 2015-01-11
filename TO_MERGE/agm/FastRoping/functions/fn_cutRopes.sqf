/*
 * Author: KoffeinFlummi
 *
 * Cuts the ropes from the helicopter
 *
 * Arguments:
 * 0: helicopter
 *
 * Return Value:
 * None
 */

_vehicle = _this select 0;

_ropes = _vehicle getVariable "AGM_Ropes";
{
  (_x select 2) ropeDetach (_x select 0);
  ropeDestroy (_x select 0);
  _x spawn {
    sleep 60;
    ropeDestroy (_this select 1);
    deleteVehicle (_this select 2);
    deleteVehicle (_this select 3);
  };
} forEach _ropes;

_vehicle setVariable ["AGM_RopesDeployed", False, True];
