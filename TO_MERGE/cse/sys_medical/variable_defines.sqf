waituntil {!isnil "cse_fnc_defineVariable"};
// public variables

	["cse_injuryVector",[],true,"cms"] call cse_fnc_defineVariable;
	["cse_treatedInjuryVector",[],true,"cms"] call cse_fnc_defineVariable;

	["cse_openWounds",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]],true,"cms"] call cse_fnc_defineVariable;
	["cse_bandagedWounds",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]],true,"cms"] call cse_fnc_defineVariable;
	["cse_fractures",[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]],true,"cms"] call cse_fnc_defineVariable;
	["cse_airway", 0, true, "cms"] call cse_fnc_defineVariable;
	["cse_tourniquets",[0,0,0,0,0,0],true,"cms"] call cse_fnc_defineVariable;
	["cse_splints",[0,0,0,0,0,0],true,"cms"] call cse_fnc_defineVariable;
	["cse_isBleeding_CMS",false,true,"cms"] call cse_fnc_defineVariable;
	["cse_hasPain_CMS",false,true,"cms"] call cse_fnc_defineVariable;
	["cse_hasLostBlood_CMS",false,true,"cms"] call cse_fnc_defineVariable;
	["cse_airwayTreated",false,true,"cms"] call cse_fnc_defineVariable;


	// Airway
	["cse_airwayOccluded", false, true, "cms"] call cse_fnc_defineVariable;
	["cse_airwayRespiratoryArrest", false, true, "cms"] call cse_fnc_defineVariable;
	["cse_airwayCollapsed", false, true, "cms"] call cse_fnc_defineVariable;
	["cse_airwayStatus", 100, false, "cms"] call cse_fnc_defineVariable;

	// logs
	["cse_quickviewLog_CMS",[],true,"cms"] call cse_fnc_defineVariable;
	["cse_activityLog_CMS",[],true,"cms"] call cse_fnc_defineVariable;
	["cse_triageLevel",0,true,"cms"] call cse_fnc_defineVariable;
	["cse_triageCard",[],true,"cms"] call cse_fnc_defineVariable;


	["cse_medicClass",0,true,"cms_static",0,true] call cse_fnc_defineVariable; // should be a persistent variable; must not be removed by a reset all defaults call
	["cse_medical_facility",0,true,"cms_static",0,true] call cse_fnc_defineVariable; // should be a persistent variable; must not be removed by a reset all defaults call

	["cse_noInstantDeath",false,true,"cms"] call cse_fnc_defineVariable;
	["cse_cardiacArrest_CMS",false,true,"cms"] call cse_fnc_defineVariable;

	// private variables
	["cse_bloodVolume",100,false,"cms"] call cse_fnc_defineVariable;
	["cse_bloodIVVolume",0,false,"cms"] call cse_fnc_defineVariable;
	["cse_plasmaIVVolume",0,false,"cms"] call cse_fnc_defineVariable;
	["cse_salineIVVolume",0,false,"cms"] call cse_fnc_defineVariable;

	["cse_pain",0,false,"cms"] call cse_fnc_defineVariable;
	["cse_heartRate",80,false,"cms"] call cse_fnc_defineVariable;
	["cse_andrenaline",0,false,"cms"] call cse_fnc_defineVariable;
	["cse_heartRateAdjustments",[],false,"cms"] call cse_fnc_defineVariable;

	["cse_bloodPressure", [80,120],false,"cms"] call cse_fnc_defineVariable;
	["cse_peripheralResistance", 100,false,"cms"] call cse_fnc_defineVariable;
	["cse_cardiacOutput", 5.25,false,"cms"] call cse_fnc_defineVariable; // Source for default: http://en.wikipedia.org/wiki/Cardiac_output#Example_values


	["cse_givenMorphine",0,false,"cms"] call cse_fnc_defineVariable;
	["cse_givenAtropine",0,false,"cms"] call cse_fnc_defineVariable;
	["cse_givenEpinephrine",0,false,"cms"] call cse_fnc_defineVariable;

	["cse_bodyPartStatus",[0,0,0,0,0,0],false,"cms"] call cse_fnc_defineVariable;
	["cse_bodyPartStatusPrevious_cms",[0,0,0,0,0,0],false,"cms"] call cse_fnc_defineVariable;

	["cse_fnc_unitLoop_CMS",false,false,"cms"] call cse_fnc_defineVariable;
