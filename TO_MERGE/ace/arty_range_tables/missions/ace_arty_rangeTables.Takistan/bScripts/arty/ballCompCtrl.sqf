//Written by beta
//Ballistics Computer dialog control


#include "defines.inc"

disableSerialization;

private ["_display", "_ctrl"];

_display = _this select 0;

_ctrl = _display displayCtrl ROUND_IDC;

//TODO: add only magazine classes that side should have

_ctrl lbAdd "60mm HE";
_ctrl lbSetData [0, "ACE_1Rnd_60mmHE_M224"];
_ctrl lbAdd "60mm WP";
_ctrl lbSetData [1, "ACE_1Rnd_60mmWP_M224"];
_ctrl lbAdd "60mm IL";
_ctrl lbSetData [2, "ACE_1Rnd_60mmHE_M224"]; //TODO: "ACE_1Rnd_60mmIL_M224" doesnt work with btab
_ctrl lbAdd "81mm HE";
_ctrl lbSetData [3, "ACE_1Rnd_81mmHE_M252"];
_ctrl lbAdd "81mm WP";
_ctrl lbSetData [4, "ACE_1Rnd_81mmWP_M252"];
_ctrl lbAdd "81mm IL";
_ctrl lbSetData [5, "ACE_1Rnd_81mmHE_M252"]; //TODO: "ACE_1Rnd_81mmIL_M252" doesnt work with btab
_ctrl lbAdd "82mm HE";
_ctrl lbSetData [6, "ACE_1Rnd_82mmHE_2B14"];
_ctrl lbAdd "82mm WP";
_ctrl lbSetData [7, "ACE_1Rnd_82mmWP_2B14"];
_ctrl lbAdd "82mm IL";
_ctrl lbSetData [8, "ACE_1Rnd_82mmHE_2B14"]; //TODO: "ACE_1Rnd_82mmIL_2B14" doesnt work with btab

_ctrl = _display displayCtrl AZI_IDC;
_ctrl ctrlSetText bArty_azimuth;
_ctrl = _display displayCtrl ELEV_IDC;
_ctrl ctrlSetText bArty_elevation;
_ctrl = _display displayCtrl CHARGE_IDC;
_ctrl ctrlSetText bArty_charge;
_ctrl = _display displayCtrl TOF_IDC;
_ctrl ctrlSetText bArty_tof;

_ctrl = _display displayCtrl TGTEASTING_IDC;
_ctrl ctrlSetText bArty_tgtEasting;
_ctrl = _display displayCtrl TGTNORTHING_IDC;
_ctrl ctrlSetText bArty_tgtNorthing;
_ctrl = _display displayCtrl TGTELEV_IDC;
_ctrl ctrlSetText bArty_tgtElev;
_ctrl = _display displayCtrl POSEASTING_IDC;
_ctrl ctrlSetText bArty_posEasting;
_ctrl = _display displayCtrl POSNORTHING_IDC;
_ctrl ctrlSetText bArty_posNorthing;
_ctrl = _display displayCtrl POSELEV_IDC;
_ctrl ctrlSetText bArty_posElev;

while {dialog} do
{
	_ctrl = _display displayCtrl AZI_IDC;
	bArty_azimuth = ctrlText _ctrl;
	_ctrl = _display displayCtrl ELEV_IDC;
	bArty_elevation = ctrlText _ctrl;
	_ctrl = _display displayCtrl CHARGE_IDC;
	bArty_charge = ctrlText _ctrl;
	_ctrl = _display displayCtrl TOF_IDC;
	bArty_tof = ctrlText _ctrl;
	
	_ctrl = _display displayCtrl TGTEASTING_IDC;
	bArty_tgtEasting = ctrlText _ctrl;
	_ctrl = _display displayCtrl TGTNORTHING_IDC;
	bArty_tgtNorthing = ctrlText _ctrl;
	_ctrl = _display displayCtrl TGTELEV_IDC;
	bArty_tgtElev = ctrlText _ctrl;
	_ctrl = _display displayCtrl POSEASTING_IDC;
	bArty_posEasting = ctrlText _ctrl;
	_ctrl = _display displayCtrl POSNORTHING_IDC;
	bArty_posNorthing = ctrlText _ctrl;
	_ctrl = _display displayCtrl POSELEV_IDC;
	bArty_posElev = ctrlText _ctrl;
	
	sleep 1;
};
