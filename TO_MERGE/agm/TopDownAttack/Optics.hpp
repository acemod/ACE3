
class RscControlsGroup;
class RscPicture;
class RscMapControl;

class RscInGameUI {
	class RscOptics_titan {
		onLoad = "uiNamespace setVariable ['AGM_dlgJavelinOptics', _this select 0]; missionNamespace setVariable ['AGM_Disposable_modeJavelin', 0];";

		class CA_javelin_elements_group: RscControlsGroup {
			class Controls {
				class CA_Javelin_Day_mode_off: RscPicture {};
				class CA_Javelin_SEEK_off: CA_Javelin_Day_mode_off {
					idc = 1005;
				};
				class GetLockedTarget: RscMapControl {
					onDraw = "call AGM_TopDownAttack_fnc_getLockedTarget";
					idc = -1;
					w = 0;
					h = 0;
				};
			};
		};
	};
};

//_dlg = uiNamespace getVariable ["AGM_dlgJavelinOptics", displayNull]; _ctrl = _dlg displayCtrl 1006; _ctrl ctrlSetTextColor [0.2941,0.8745,0.2157,1.0]

// on		colorText[] = {0.2941, 0.8745, 0.2157, 1.0};
// off		colorText[] = {0.2941, 0.2941, 0.2941, 1.0};
// orange	colorText[] = {0.9255, 0.5216, 0.1216, 1.0};

/*
CA_javelin_elements_group: 	170
CA_Javelin_Day_mode_off: 	1001
CA_Javelin_Day_mode: 		160
CA_Javelin_WFOV_mode_off: 	1004
CA_Javelin_WFOV_mode_group: 163
CA_Javelin_NFOV_mode_off: 	1003
CA_Javelin_NFOV_mode_group: 162
CA_Javelin_SEEK_off: 		1005 //1001
CA_Javelin_SEEK: 			166
CA_Javelin_Missle_off: 		1032
CA_Javelin_Missle: 			167
CA_Javelin_CLU_off: 		1027
CA_Javelin_HangFire_off: 	1028
CA_Javelin_TOP_off: 		1006
CA_Javelin_DIR: 			1007
CA_Javelin_FLTR_mode_off: 	1002
CA_Javelin_FLTR_mode: 		161
*/
