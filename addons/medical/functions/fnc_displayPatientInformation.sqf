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
		private ["_target", "_display", "_alphaLevel", "_damaged", "_availableSelections", "_openWounds", "_selectionBloodLoss", "_red", "_green", "_blue", "_alphaLevel", "_allInjuryTexts", "_lbCtrl", "_genericMessages"];
		_target = (_this select 0) select 0;
		if (GVAR(displayPatientInformationTarget) != _target) exitwith {
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};

		disableSerialization;
		_display = uiNamespace getvariable QGVAR(DisplayInformation);
		if (isnil "_display") exitwith {
			[_this select 1] call CBA_fnc_removePerFrameHandler;
		};

		_allInjuryTexts = [];
		_genericMessages = [];
		if (_target getvariable[QGVAR(isBleeding), false]) then {
			_genericMessages pushback [localize "STR_ACE_MEDICAL_STATUS_BLEEDING", [1, 1, 1, 1]];
		};
		if (_target getvariable[QGVAR(hasLostBlood), false]) then {
			_genericMessages pushback [localize "STR_ACE_MEDICAL_STATUS_LOST_BLOOD", [1, 0.1, 0.1, 1]];
		};

		if (((_target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]]) select GVAR(currentSelectedSelectionN)) > 0) then {
			_genericMessages pushback [localize "STR_ACE_MEDICAL_STATUS_TOURNIQUET_APPLIED", [0.5, 0.5, 0, 1]];
		};

		_selectionBloodLoss = [0,0,0,0,0,0];
		if (GVAR(level) >= 1) then {
			_openWounds = _target getvariable [QGVAR(openWounds), []];
			private "_amountOf";
			{
				_amountOf = _x select 3;
				// Find how much this bodypart is bleeding
				_selectionBloodLoss set [(_x select 2), (_selectionBloodLoss select (_x select 2)) + (15 * ((_x select 4) * _amountOf))];
				if (GVAR(currentSelectedSelectionN) == (_x select 2)) then {
					// Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
					if (_amountOf > 0) then {
						if (_amountOf >= 1) then {
							_allInjuryTexts pushback format["%2x %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6, _amountOf];
						} else {
							// TODO localization
							_allInjuryTexts pushback format["Partial %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6];
						};
					};
				};
			}foreach _openWounds;
		} else {
			// TODO handle basic medical colors for body part selections here


		};

		// Handle the body image coloring
		_damaged = [false, false, false, false, false, false];
		_availableSelections = [50,51,52,53,54,55];
		{
		    private ["_red", "_green", "_blue"];
		    _total = _x;

		    _red = 1;
		    _green = 1;
		    _blue = 1;
		    if (_total >0) then {
		        _green = 0.9 - _total;
		        if (_green < 0.0) then {
		            _green = 0.0;
		        };
		        _blue = _green;
		        _damaged set[_foreachIndex, true];
		    };
		    (_display displayCtrl (_availableSelections select _foreachIndex)) ctrlSetTextColor [_red, _green, _blue, 1.0];
		}foreach _selectionBloodLoss;

		// TODO fill the lb with the appropiate information for the patient
		_lbCtrl = (_display displayCtrl 200);
		lbClear _lbCtrl;
		{
			_lbCtrl lbAdd (_x select 0);
    		_lbCtrl lbSetColor [_foreachIndex, _x select 1];
		}foreach _genericMessages;
		{
			_lbCtrl lbAdd _x;
		}foreach _allInjuryTexts;
		if (count _genericMessages == 0 && {count _allInjuryTexts == 0}) then {
			_lbCtrl lbAdd "No injuries on this bodypart..";
		};

	}, 0, [_target]] call CBA_fnc_addPerFrameHandler;

} else {
	("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
};