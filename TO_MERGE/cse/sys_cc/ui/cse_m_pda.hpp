
class cse_m_pda : cse_m_tablet {
	//idd = 590824;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_m_pda', _this select 0]; ['cse_m_pda', true] call cse_fnc_gui_blurScreen;";
	onUnload = " ['cse_m_pda', false] call cse_fnc_gui_blurScreen;";
	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = -0.7;
			y = -0.3;
			w = 2.35;
			h = 1.55;
			text = "cse\cse_sys_cc\data\m_pda.paa";
		};
	};
};