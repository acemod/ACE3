if (isNil "cse_AB_OnlyActiveForLocalPlayer") then { cse_AB_OnlyActiveForLocalPlayer = false; };
if (isNil "cse_AB_DisabledInFullAutoMode") then { cse_AB_DisabledInFullAutoMode = false; };
if (isNil "cse_AB_UseDLL") then { cse_AB_UseDLL = false; };

if (cse_AB_ExtensionsEnabled && ("AdvancedBallistics" callExtension "version") == "1.0") then {
	cse_AB_UseDLL = true;
	cse_ab_ballistics_fnc_advanced_ballistics = cse_ab_ballistics_fnc_advanced_ballistics_extension;
};

cse_AB_bulletDatabase = [];
cse_AB_bulletDatabaseStartTime = [];
cse_AB_bulletDatabaseSpeed = [];
cse_AB_bulletDatabaseFrames = [];
cse_AB_bulletDatabaseLastFrame = [];
cse_AB_bulletDatabaseHDeflect = [];
cse_AB_bulletDatabaseSpinDrift = [];
cse_AB_bulletDatabaseOccupiedIndices = [];
cse_AB_bulletDatabaseFreeIndices = [];

cse_AB_WindInfo = false;
cse_AB_WindInfoStart = time;

cse_AB_Protractor = false;
cse_AB_ProtractorStart = time;

cse_AB_Altitude = 0;
cse_AB_Latitude = 50;

cse_AB_Temperature = 15;
cse_AB_Humidity = 50;

if (worldName in ["Chernarus", "Bootcamp_ACR", "Woodland_ACR", "utes"]) then { cse_AB_Latitude = 50; cse_AB_Altitude = 0; };
if (worldName in ["Altis", "Stratis"]) then { cse_AB_Latitude = 40; cse_AB_Altitude = 0; };
if (worldName in ["Takistan", "Zargabad", "Mountains_ACR"]) then { cse_AB_Latitude = 35; cse_AB_Altitude = 2000; };
if (worldName in ["Shapur_BAF", "ProvingGrounds_PMC"]) then { cse_AB_Latitude = 35; cse_AB_Altitude = 100; };
if (worldName in ["fallujah"]) then { cse_AB_Latitude = 33; cse_AB_Altitude = 0; };
if (worldName in ["fata", "Abbottabad"]) then { cse_AB_Latitude = 30; cse_AB_Altitude = 1000; };
if (worldName in ["sfp_wamako"]) then { cse_AB_Latitude = 14; cse_AB_Altitude = 0; };
if (worldName in ["sfp_sturko"]) then { cse_AB_Latitude = 56; cse_AB_Altitude = 0; };
if (worldName in ["Bornholm"]) then { cse_AB_Latitude = 55; cse_AB_Altitude = 0; };
if (worldName in ["Imrali"]) then { cse_AB_Latitude = 40; cse_AB_Altitude = 0; };
if (worldName in ["Caribou"]) then { cse_AB_Latitude = 68; cse_AB_Altitude = 0; };
if (worldName in ["Namalsk"]) then { cse_AB_Latitude = 65; cse_AB_Altitude = 0; };
if (worldName in ["MCN_Aliabad"]) then { cse_AB_Latitude = 36; cse_AB_Altitude = 0; };
if (worldName in ["Clafghan"]) then { cse_AB_Latitude = 34; cse_AB_Altitude = 640; };
if (worldName in ["Sangin", "hellskitchen"]) then { cse_AB_Latitude = 32; cse_AB_Altitude = 0; };
if (worldName in ["Sara"]) then { cse_AB_Latitude = 40; cse_AB_Altitude = 0; };
if (worldName in ["reshmaan"]) then { cse_AB_Latitude = 35; cse_AB_Altitude = 2000; };
if (worldName in ["Thirsk"]) then { cse_AB_Latitude = 65; cse_AB_Altitude = 0; };
if (worldName in ["lingor"]) then { cse_AB_Latitude = -4; cse_AB_Altitude = 0; };

waitUntil {!isNil "cse_gui"};
waitUntil {!isNull player};

if (isNil {player getVariable "cse_enabled_AdvancedBallistics"}) then {
	player setVariable ["cse_enabled_AdvancedBallistics", !cse_AB_DisabledByDefault, true];
};

if (cse_AB_MilTurretsEnabled) then {
	// Elevation minor step up
	["cse_sys_ballistics_AB_Adjustment_Up", (["cse_sys_ballistics_AB_Adjustment_Up","action",[200, 0,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[0, false] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Up","action", "Minor adjustment up", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Elevation minor step down
	["cse_sys_ballistics_AB_Adjustment_Down", (["cse_sys_ballistics_AB_Adjustment_Down","action",[208, 0,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[1, false] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Down","action", "Minor adjustment Down", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Windage minor step left
	["cse_sys_ballistics_AB_Adjustment_Left", (["cse_sys_ballistics_AB_Adjustment_Left","action",[203, 0,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[2, false] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Left","action", "Minor adjustment Left", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Windage minor step right
	["cse_sys_ballistics_AB_Adjustment_Right", (["cse_sys_ballistics_AB_Adjustment_Right","action",[205, 0,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[3, false] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Right","action", "Minor adjustment Right", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Elevation major step up
	["cse_sys_ballistics_AB_Adjustment_Up_major", (["cse_sys_ballistics_AB_Adjustment_Up_major","action",[200, 1,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[0, true] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Up_major","action", "Major adjustment up", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Elevation major step down
	["cse_sys_ballistics_AB_Adjustment_Down_major", (["cse_sys_ballistics_AB_Adjustment_Down_major","action",[208, 1,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[1, true] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Down_major","action", "Major adjustment Down", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Windage major step left
	["cse_sys_ballistics_AB_Adjustment_Left_major", (["cse_sys_ballistics_AB_Adjustment_Left_major","action",[203, 1,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[2, true] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Left_major","action", "Major adjustment Left_major", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Windage major step right
	["cse_sys_ballistics_AB_Adjustment_Right_major", (["cse_sys_ballistics_AB_Adjustment_Right_major","action",[205, 1,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[3, true] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;

	["cse_sys_ballistics_AB_Adjustment_Right_major","action", "Major adjustment Right", "Opens the ATragMX dialog"] call cse_fnc_settingsDefineDetails_F;

	// Scope zero adjustment
	["cse_sys_ballistics_AB_Adjustment_Zero_Up", (["cse_sys_ballistics_AB_Adjustment_Zero_Up","action",[200, 1,1,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[4, false] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;
	["cse_sys_ballistics_AB_Adjustment_Zero_Up","action", "Zero adjustment up", "Zero adjustment up"] call cse_fnc_settingsDefineDetails_F;

	["cse_sys_ballistics_AB_Adjustment_Zero_Down", (["cse_sys_ballistics_AB_Adjustment_Zero_Down","action",[208, 1,1,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			[5, false] call cse_ab_ballistics_fnc_adjust_turret;
		}] call cse_fnc_addKeyBindingForAction_F;
	["cse_sys_ballistics_AB_Adjustment_Zero_Down","action", "Zero adjustment down", "Zero adjustment down"] call cse_fnc_settingsDefineDetails_F;
};

// Parallax Adjustment
if (cse_AB_MirageEnabled) then {
	["cse_sys_ballistics_AB_Adjustment_Parallax_Up", (["cse_sys_ballistics_AB_Adjustment_Parallax_Up","action",[200, 0,1,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			0 call cse_ab_ballistics_fnc_adjust_parallax;
		}] call cse_fnc_addKeyBindingForAction_F;
	["cse_sys_ballistics_AB_Adjustment_Parallax_Up","action", "Parallax adjustment up", "Parallax adjustment up"] call cse_fnc_settingsDefineDetails_F;

	["cse_sys_ballistics_AB_Adjustment_Parallax_Down", (["cse_sys_ballistics_AB_Adjustment_Parallax_Down","action",[208, 0,1,0]] call cse_fnc_getKeyBindingFromProfile_F),
		{
			1 call cse_ab_ballistics_fnc_adjust_parallax;
		}] call cse_fnc_addKeyBindingForAction_F;
	["cse_sys_ballistics_AB_Adjustment_Parallax_Down","action", "Parallax adjustment down", "Parallax adjustment down"] call cse_fnc_settingsDefineDetails_F;
};

// Show wind Info
["cse_sys_ballistics_AB_Display_Wind_Info", (["cse_sys_ballistics_AB_Display_Wind_Info","action",[37,1,0,0]] call cse_fnc_getKeyBindingFromProfile_F),
	{
		_this call cse_ab_ballistics_fnc_display_wind_info;
	}] call cse_fnc_addKeyBindingForAction_F;
["cse_sys_ballistics_AB_Display_Wind_Info","action", "Show wind info", "Show wind info"] call cse_fnc_settingsDefineDetails_F;

// Show protractor
["cse_sys_ballistics_AB_Display_Protractor", (["cse_sys_ballistics_AB_Display_Protractor","action",[37,1,1,0]] call cse_fnc_getKeyBindingFromProfile_F),
	{
		_this call cse_ab_ballistics_fnc_display_protractor;
	}] call cse_fnc_addKeyBindingForAction_F;
["cse_sys_ballistics_AB_Display_Protractor","action", "Show protractor", "Show protractor"] call cse_fnc_settingsDefineDetails_F;

_handle = _this spawn cse_ab_ballistics_fnc_climate_simulation;
_handle = _this spawn cse_ab_ballistics_fnc_mirage_simulation;
_handle = _this spawn cse_ab_ballistics_fnc_initialize_terrain_extension;
