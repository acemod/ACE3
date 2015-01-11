// by commy2

disableSerialization;
_ctrl = ctrlParent (_this select 0) displayCtrl 40;

_ctrl ctrlSetPosition [
	(_this select 1) + 0.01 * safezoneW,
	(_this select 2) + 0.01 * safezoneH,
	2.0 / 16 * safezoneW,
	0.3 / 9 * safezoneH
];
_ctrl ctrlCommit 0;
