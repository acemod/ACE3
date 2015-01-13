class cse_m_tablet_uk : cse_m_tablet {
	//idd = 590824;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_m_tablet_uk', _this select 0]; ['cse_m_tablet_uk', true] call cse_fnc_gui_blurScreen;";
	onUnload = " ['cse_m_tablet_uk', false] call cse_fnc_gui_blurScreen;";

	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = -0.7;
			y = -0.3;
			w = 2.35;
			h = 1.55;
			text = "cse\cse_sys_cc\data\uk_tablet.paa";
		};
	};
};

class cse_m_tablet_o : cse_m_tablet {
	//idd = 590824;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_m_tablet_o', _this select 0]; ['cse_m_tablet_o', true] call cse_fnc_gui_blurScreen;";
	onUnload = " ['cse_m_tablet_o', false] call cse_fnc_gui_blurScreen;";
	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = -0.7;
			y = -0.3;
			w = 2.35;
			h = 1.55;
			text = "cse\cse_sys_cc\data\m_tablet.paa";
		};
	};
};

class cse_m_pda_o : cse_m_pda {
	//idd = 590824;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_m_pda_o', _this select 0]; ['cse_m_pda_o', true] call cse_fnc_gui_blurScreen;";
	onUnload = " ['cse_m_pda_o', false] call cse_fnc_gui_blurScreen;";
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

class cse_m_tablet_g : cse_m_tablet {
	//idd = 590824;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_m_tablet_g', _this select 0]; ['cse_m_tablet_g', true] call cse_fnc_gui_blurScreen;";
	onUnload = " ['cse_m_tablet_g', false] call cse_fnc_gui_blurScreen;";
	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = -0.7;
			y = -0.3;
			w = 2.35;
			h = 1.55;
			text = "cse\cse_sys_cc\data\m_tablet.paa";
		};
	};
};

class cse_m_pda_g : cse_m_pda {
	//idd = 590824;
	movingEnable = true;
	onLoad = "uiNamespace setVariable ['cse_m_pda_g', _this select 0]; ['cse_m_pda_g', true] call cse_fnc_gui_blurScreen;";
	onUnload = " ['cse_m_pda_g', false] call cse_fnc_gui_blurScreen;";
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