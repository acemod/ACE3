//Written by beta
//Calculate firemission


#include "defines.inc"

disableSerialization;

private ["_azimuth", "_elevation", "_pos", "_tgtPos", "_eastingTgt", "_northingTgt", "_elevationTgt", "_eastingPos", "_northingPos", "_elevationPos", "_ctrl", "_readyFlag", "_tgtGridFlag", "_tgtElevFlag", "_posGridFlag", "_posElevFlag", "_magazine", "_magazineFlag", "_charge", "_weapon", "_vehicle", "_chargeStr"];

_readyFlag = false;

_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl ROUND_IDC;
_magazine = "";
_magazine = _ctrl lbData (lbCurSel _ctrl);

_magazineFlag = false;
if (_magazine != "") then
{
	_magazineFlag = true;
};

_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl TGTEASTING_IDC;
_eastingTgt = ctrlText _ctrl;
_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl TGTNORTHING_IDC;
_northingTgt = ctrlText _ctrl;

_tgtGridFlag = false;
if ((_northingTgt != "") && (_eastingTgt != "")) then
{
	_tgtGridFlag = true;
};

_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl POSEASTING_IDC;
_eastingPos = ctrlText _ctrl;
_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl POSNORTHING_IDC;
_northingPos = ctrlText _ctrl;

_posGridFlag = false;
if ((_northingPos != "") && (_eastingPos != "")) then
{
	_posGridFlag = true;
};

_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl TGTELEV_IDC;
_elevationTgt = ctrlText _ctrl;

_tgtElevFlag = false;
if (_elevationTgt != "") then
{
	_tgtElevFlag = true;
};

_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl POSELEV_IDC;
_elevationPos = ctrlText _ctrl;

_posElevFlag = false;
if (_elevationPos != "") then
{
	_posElevFlag = true;
};

if (_magazineFlag) then
{
	if (_tgtGridFlag) then
	{
		if (_tgtElevFlag) then
		{
			if (_posGridFlag) then
			{
				if (_posElevFlag) then
				{
					_readyFlag = true;
				}
				else
				{
					hint "You must input a valid elevation for your position.";
				};
			}
			else
			{
				hint "You must input a valid six, eight, or ten figure grid reference for your position.";
			};
		}
		else
		{
			hint "You must input a valid elevation for the target position.";
		};
	}
	else
	{
		hint "You must input a valid six, eight, or ten figure grid reference for the target position.";
	};
}
else
{
	hint "You must select a round type.";
};

if (_readyFlag) then
{
	_tgtPos = [[_eastingTgt, _northingTgt], true] call CBA_fnc_mapGridToPos;
	_tgtPos = [_tgtPos select 0, _tgtPos select 1, parseNumber _elevationTgt];
	
	_pos = [[_eastingPos, _northingPos], true] call CBA_fnc_mapGridToPos;
	_pos = [_pos select 0, _pos select 1, parseNumber _elevationPos];
	
	_firingSolution = [];
	_charge = "";
	_chargeStr = "";
	_vehicle = "";
	_weapon = "";
	
	switch (_magazine) do
	{
		case "ACE_1Rnd_60mmHE_M224": { _vehicle = "ACE_M224"; _weapon = "ACE_M224_Tri"; };
		case "ACE_1Rnd_60mmWP_M224": { _vehicle = "ACE_M224"; _weapon = "ACE_M224_Tri"; };
		case "ACE_1Rnd_60mmIL_M224": { _vehicle = "ACE_M224"; _weapon = "ACE_M224_Tri"; };
		case "ACE_1Rnd_81mmHE_M252": { _vehicle = "ACE_M252"; _weapon = "ACE_M252_Tri"; };
		case "ACE_1Rnd_81mmWP_M252": { _vehicle = "ACE_M252"; _weapon = "ACE_M252_Tri"; };
		case "ACE_1Rnd_81mmIL_M252": { _vehicle = "ACE_M252"; _weapon = "ACE_M252_Tri"; };
		case "ACE_1Rnd_82mmHE_2B14": { _vehicle = "ACE_2B14_82mm"; _weapon = "ACE_2B14_82mm_Tri"; };
		case "ACE_1Rnd_82mmWP_2B14": { _vehicle = "ACE_2B14_82mm"; _weapon = "ACE_2B14_82mm_Tri"; };
		case "ACE_1Rnd_82mmIL_2B14": { _vehicle = "ACE_2B14_82mm"; _weapon = "ACE_2B14_82mm_Tri"; };
	};
	
	{
		_firingSolution = [_pos, _tgtPos, _vehicle, _weapon, _magazine, _x] call bArty_fnc_getSolution;
		
		if ((_firingSolution select 1) > 0) exitWith
		{
			_charge = _x;
		};
	} forEach ["Single1", "Single2", "Single3"];
	
	switch (_charge) do
	{
		case "Single1": { _chargeStr = "Close"; };
		case "Single2": { _chargeStr = "Medium"; };
		case "Single3": { _chargeStr = "Far"; };
	};
	
	if ((_firingSolution select 1) > 0) then
	{
		_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl AZI_IDC;
		_ctrl ctrlSetText ("Azimuth (mils): " + (str (_firingSolution select 0)));
		_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl ELEV_IDC;
		_ctrl ctrlSetText ("Elevation (mils): " + (str (_firingSolution select 1)));
		_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl TOF_IDC;
		_ctrl ctrlSetText ("Time of Flight: " + (_firingSolution select 2) + "s");
		_ctrl = (findDisplay BALLCOMP_IDD) displayCtrl CHARGE_IDC;
		_ctrl ctrlSetText ("Charge: " + _chargeStr);
		
		hint "Fire solution calculated.";
	}
	else
	{
		hint "Target grid reference out of range.";
	};
};
