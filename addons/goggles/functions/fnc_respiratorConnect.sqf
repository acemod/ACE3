private _unit = ACE_player;

if (!local _unit) exitWith {};

private _goggles		= goggles _unit;
private _backpack		= backpackContainer _unit;
private _backpackType	= backpack _unit;
private _objectTextures = getObjectTextures _backpack;

if (_objectTextures#1 isEqualTo "" && _objectTextures#2 isEqualTo "") then {
	switch true do {
		case (_goggles in ["G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_01_nofilter_F"]): {
			switch true do {
				case (_backpackType isEqualTo "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType isEqualTo "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_goggles in ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_black_nofilter_F"]): {
			switch true do {
				case (_backpackType isEqualTo "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_black_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType isEqualTo "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_black_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_goggles in ["G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_olive_nofilter_F"]): {
			switch true do {
				case (_backpackType isEqualTo "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_olive_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType isEqualTo "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_olive_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_goggles in ["G_AirPurifyingRespirator_02_sand_F", "G_AirPurifyingRespirator_02_sand_nofilter_F"]): {
			switch true do {
				case (_backpackType isEqualTo "B_CombinationUnitRespirator_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_sand_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [3, ""];
				};
				case (_backpackType isEqualTo "B_SCBA_01_F"): {
					_unit linkItem "G_AirPurifyingRespirator_02_sand_nofilter_F";

					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
		case (_goggles isEqualTo "G_RegulatorMask_F"): {
			switch true do {
				case (_backpackType isEqualTo "B_CombinationUnitRespirator_01_F"): {
					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				};
				case (_backpackType isEqualTo "B_SCBA_01_F"): {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
				};
			};
		};
	};
	default {};
};
