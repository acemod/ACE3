class CfgWeapons {
	class ACE_Item;
	class ace_arty_rangeTable_base: ACE_Item {
		scope = 1;
		ace_size = 500;
		ace_weight = 0.1;
		picture = QPATHTO_T(data\equip\w_table_ca.paa);
	};

	// mortars
	class ace_arty_rangeTable_m224: ace_arty_rangeTable_base {
		scope = 2;
		descriptionshort = "M224 Tables";
		displayname = "M224 60mm Range Tables";
		ace_sys_arty_tableData = QUOTE(PATHTO(tables\m224));
	};
	class ace_arty_rangeTable_m252: ace_arty_rangeTable_base {
		scope = 2;
		descriptionshort = "M252 Tables";
		displayname = "M252 81mm Range Tables";
		ace_sys_arty_tableData = QUOTE(PATHTO(tables\m252));
	};
	class ace_arty_rangeTable_2b14: ace_arty_rangeTable_base {
		scope = 2;
		descriptionshort = "2B14 Tables";
		displayname = "2B14 82mm Range Tables";
		ace_sys_arty_tableData = QUOTE(PATHTO(tables\2b14));
	};
	class ace_arty_rangeTable_tampella: ace_arty_rangeTable_base {
		scope = 2;
		descriptionshort = "120mm Tampella Tables";
		displayname = "Tampella 120mm Range Tables";
		ace_sys_arty_tableData = QUOTE(PATHTO(tables\120_tampella));
	};	
	// arty
	class ace_arty_rangeTable_m119: ace_arty_rangeTable_base {
		scope = 2;
		descriptionshort = "M119 Tables";
		displayname = "M119 105mm Range Tables";
		ace_arty_tableData = QUOTE(PATHTO(tables\m119));
	};
	/*
	class ace_arty_rangeTable_d30: ace_arty_rangeTable_base {
		descriptionshort = "D30 Tables";
		displayname = "D30 122mm Range Tables";
		ace_sys_arty_tableData = QUOTE(PATHTO(tables\d30));
	};
	*/

  //////////////// legacy tables
  // mortars
  class ace_arty_rangeTable_m224_legacy: ace_arty_rangeTable_m224 { // no longer needed for bis click boom artillery, fall back to the real thing
  };
  class ace_arty_rangeTable_m252_legacy: ace_arty_rangeTable_m252 { // no longer needed for bis click boom artillery  
  };
  class ace_arty_rangeTable_2b14_legacy: ace_arty_rangeTable_2b14{ // no longer needed for bis click boom artillery
  };

  // arty
  class ace_arty_rangeTable_m119_legacy: ace_arty_rangeTable_base {
    scope = 2;
    descriptionshort = "M119 Tables";
    displayname = "M119 105mm Range Tables";
    ace_arty_tableData = QUOTE(PATHTO(tables\m119_legacy));
  };
  class ace_arty_rangeTable_d30_legacy: ace_arty_rangeTable_base {
    scope = 2;
    descriptionshort = "D30 Tables";
    displayname = "D30 122mm Range Tables";
    ace_arty_tableData = QUOTE(PATHTO(tables\d30_legacy));
  };
};