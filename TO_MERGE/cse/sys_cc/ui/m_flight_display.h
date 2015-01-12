class cse_m_flight_display {
	idd = 590823;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_m_flight_display', _this select 0]; ['cse_m_flight_display', true] call cse_fnc_gui_blurScreen;";
	onUnload = "['cse_m_flight_display', false] call cse_fnc_gui_blurScreen;";

	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = "5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "-1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "30 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "cse\cse_sys_cc\data\m_flight_display.paa";
		};
	};
	class controls {

		class mapDisplay: cse_gui_mapBase {
			idc = 10;
			x = "11.75 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "16.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "22 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			type = 101;
			moveOnEdges = 0;
			showCountourInterval = 1;
		};
	};
};


class cse_m_vehicle_display {
	idd = 590823;
	movingEnable = false;
	onLoad = "uiNamespace setVariable ['cse_m_vehicle_display', _this select 0]; ['cse_m_vehicle_display', true] call cse_fnc_gui_blurScreen;";
	onUnload = "['cse_m_vehicle_display', false] call cse_fnc_gui_blurScreen;";

	class controlsBackground {
		class cse_background : cse_gui_backgroundBase {
			idc = -1;
			x = "-5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "-1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "55 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "30 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			text = "cse\cse_sys_cc\data\m_vehicle_display.paa";
		};
	};
	class controls {

		class mapDisplay: cse_gui_mapBase {
			idc = 10;
			x = "8.75 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "27.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "22 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			type = 101;
			moveOnEdges = 0;
			showCountourInterval = 1;
		};
	};
};