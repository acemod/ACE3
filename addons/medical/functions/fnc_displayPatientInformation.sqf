/*
 * Author: Glowbal
 * Displays the patient information for given unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Show <BOOL> <OPTIONAL>
 *
 * ReturnValue:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_target", "_show"];
_target = _this select 0;
_show = if (count _this > 1) then {_this select 1} else {true};

GVAR(displayPatientInformationTarget) = if (_show) then {_target} else {ObjNull};

if (_show) then {

	("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutRsc [QGVAR(DisplayInformation),"PLAIN"];

	[{
		private ["_target", "_display", "_alphaLevel", "_damaged", "_availableSelections", "_openWounds", "_selectionBloodLoss", "_red", "_green", "_blue", "_alphaLevel"];
		_target = (_this select 0) select 0;
		if (GVAR(displayPatientInformationTarget) != _target) exitwith {
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};

		disableSerialization;
		_display = uiNamespace getvariable QGVAR(DisplayInformation);
		if (isnil "_display") exitwith {
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};

		_alphaLevel = 1.0;
		_damaged = [false, false, false, false, false, false];
		_availableSelections = [50,51,52,53,54,55];
		_openWounds = _target getvariable [QGVAR(openWounds), []];

		_selectionBloodLoss = [0,0,0,0,0,0];
		{
			_selectionBloodLoss set [(_x select 2), (_selectionBloodLoss select (_x select 2)) + ((_x select 4) * (_x select 3))];
		}foreach _openWounds;

		{
		    private ["_red", "_green", "_blue"];
		    _total = _x;

		    _red = 1;
		    _green = 1;
		    _blue = 1;
		    if (_total >0) then {
		        _green = 0.9 - (15*(_total));
		        if (_green < 0.0) then {
		            _green = 0.0;
		        };
		        _blue = _green;
		        _damaged set[_foreachIndex, true];
		    };
		    (_display displayCtrl (_availableSelections select _foreachIndex)) ctrlSetTextColor [_red, _green, _blue, _alphaLevel];
		}foreach _selectionBloodLoss;

		// TODO fill the lb with the appropiate information for the patient

	}, 0, [_target]] call CBA_fnc_addPerFrameHandler;

} else {
	("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutRsc ["","PLAIN"];
};