class cse_view_small: cse_m_tablet {
	onLoad = "uiNamespace setVariable ['cse_view_small', _this select 0];";
	duration = 10e10;
	fadein = 0;
	fadeout = 0;
	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = 3;
			y = 2;
			w = 1;
			h = 0.5;
			text = "";
		};
	};
};