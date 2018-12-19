#include "script_component.hpp"
/*
 * Author: Salbei
 * Handle digging Serverside, including multi dig.
 *
 * Arguments:
 * 0: Trench <OBJECT>
 * 1: Unit <OBJECT>
 * 2: State <BOOLEAN>
 * 3: Initiator <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_handleDiggingServerSide
 *
 * Public: No
 */

if !(isServer) exitWith {};

params ["_trench", "_unit", ["_state", false], ["_initiator", false]];

if (_initiator) then {
   if (_state) then {

      private _handle = [
         {
            params ["_args", "_handle"];
            _args params ["_trench", "_digTime"];

            if (
               !(_trench getVariable [QGVAR(digging), false])
               || ((_trench getVariable [QGVAR(diggerCount), 0]) < 1)
            ) exitWith {
               [_handle] call CBA_fnc_removePerFrameHandler;
            };

            _trench setVariable [QGVAR(progress), (_trench getVariable [QGVAR(progress), 0]) + ((1/(_digTime *10)) * _diggerCount)];
         },
         0.1,
         [
            _trench,
            missionNamespace getVariable [getText (configFile >> "CfgVehicles" >> (typeOf _trench) >> QGVAR(diggingDuration)), 20]
         ]
      ] call CBA_fnc_addPerFrameHandler;

      _trench setVariable [QGVAR(pfh), _handle];
   }else{
      [_trench getVariable QGVAR(pfh)] call CBA_fnc_removePerFrameHandler;
   };
} else {
   if (isNull (_trench getVariable [QGVAR(mainDigger), objNull])) exitWith {};

   [_trench, _unit, _trench getVariable [QGVAR(progress), 0]] remoteExecCall [FUNC(addDigger), _unit, false];
};
