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
GVAR(currentSelectedSelectionN) = if (count _this > 2) then {_this select 2} else {0};

GVAR(displayPatientInformationTarget) = if (_show) then {_target} else {ObjNull};

if (_show) then {

	("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutRsc [QGVAR(DisplayInformation),"PLAIN"];

	[{
		private ["_target", "_display", "_alphaLevel", "_damaged", "_availableSelections", "_openWounds", "_selectionBloodLoss", "_red", "_green", "_blue", "_alphaLevel", "_allInjuryTexts", "_lbCtrl"];
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

		_allInjuryTexts = [];

		_selectionBloodLoss = [0,0,0,0,0,0];
		{
			// Find how much this bodypart is bleeding
			_selectionBloodLoss set [(_x select 2), (_selectionBloodLoss select (_x select 2)) + ((_x select 4) * (_x select 3))];
			if (GVAR(currentSelectedSelectionN) == (_x select 2)) then {
				// Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
				if (_x select 3 > 0) then {
					_allInjuryTexts pushback format["%2x %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6, _x select 3];
				};
			};
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
		_lbCtrl = (_display displayCtrl 200);
		lbClear _lbCtrl;
		{
			_lbCtrl lbAdd _x;
		}foreach _allInjuryTexts;
		if (count _allInjuryTexts == 0) then {
			_lbCtrl lbAdd "No injuries on this bodypart..";
		};

	}, 0, [_target]] call CBA_fnc_addPerFrameHandler;

} else {
	("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutRsc ["","PLAIN"];
};