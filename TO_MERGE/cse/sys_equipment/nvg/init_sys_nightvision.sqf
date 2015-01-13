#define PP_EFFECT_GRAIN_INTENSITVE 		0.25	// 0 to 1
#define PP_EFFECT_GRAIN_SHARPNESS		1		// 0 to 20
#define PP_EFFECT_GRAIN_SIZE 			2.5		// 1 to 8
#define PP_EFFECT_GRAIN_INTENSITY_X0 	0.2		// float, No range
#define PP_EFFECT_GRAIN_INTENSITY_X1 	0.2 	// float, No range
#define PP_EFFECT_GRAIN_MONOCHROMATIC	false	// bool


if (!hasInterface) exitwith {};
CSE_SYS_NVG_GRAIN_EFFECT_DISPLAY = false;
// need to add some key handlers

	waituntil{!isnil "cse_gui" && !isnil "cse_main"};
	["Enabling CSE NVG systems",2] call cse_fnc_debug;
	_ppEffect_NVGAdjustBrightness = ppEffectCreate ["ColorCorrections", 1587];
	_ppEffect_NVGAdjustBrightness ppEffectForceInNVG true;
	_ppEffect_NVGAdjustBrightness ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
	_ppEffect_NVGAdjustBrightness ppEffectCommit 0;


	_ppEffect_NVGAdjustEffect = ppEffectCreate ["FilmGrain", 2451];
	_ppEffect_NVGAdjustEffect ppEffectForceInNVG true;
	_ppEffect_NVGAdjustEffect ppEffectAdjust [PP_EFFECT_GRAIN_INTENSITVE, PP_EFFECT_GRAIN_SHARPNESS, PP_EFFECT_GRAIN_SIZE, PP_EFFECT_GRAIN_INTENSITY_X0, PP_EFFECT_GRAIN_INTENSITY_X1, PP_EFFECT_GRAIN_MONOCHROMATIC];
	_ppEffect_NVGAdjustEffect ppEffectCommit 0;


	// Refactor this
	["cse_sys_nightvision", [_ppEffect_NVGAdjustBrightness, _ppEffect_NVGAdjustEffect], {
		_ppEffect_NVGAdjustBrightness = _this select 0;
		_ppEffect_NVGAdjustEffect = _this select 1;

			if (((currentVisionMode player == 1) || (currentVisionMode (vehicle player) == 1))&& !isNull(findDisplay 46)) then {
				_ppEffect_NVGAdjustBrightness ppEffectEnable true;
				_newBrightness = player getvariable ["cse_sys_nightvision_brightness", 1];
				_ppEffect_NVGAdjustBrightness ppEffectAdjust [1, _newBrightness, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 1]];
				_ppEffect_NVGAdjustBrightness ppEffectCommit 0;
				if (CSE_SYS_NVG_GRAIN_EFFECT_DISPLAY) then {
					_ppEffect_NVGAdjustEffect ppEffectEnable true;
				};
			} else {
				_ppEffect_NVGAdjustBrightness ppEffectEnable false;
				_ppEffect_NVGAdjustEffect ppEffectEnable false;
			};

	}] call cse_fnc_addTaskToPool_f;

["cse_sys_nightvision_grain_effect_display", ["Enable", "Disable"], (["cse_sys_nightvision_grain_effect_display", 0] call cse_fnc_getClientSideOptionFromProfile_F), {
	CSE_SYS_NVG_GRAIN_EFFECT_DISPLAY = (_this select 1) == 0;
}] call cse_fnc_addClientSideOptions_f;

["cse_sys_nightvision_grain_effect_display","option","Use Grain effect","Use grain effect for nightvision"] call cse_fnc_settingsDefineDetails_F;
