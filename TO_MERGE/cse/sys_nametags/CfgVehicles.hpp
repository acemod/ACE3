// TODO Check what faction classes are available within ACE and move this to a core pbo
class CfgFactionClasses
{
	class NO_CATEGORY;
	class ACEMisc: NO_CATEGORY {
		displayName = "ACE Misc Modules";
	};
};


class CfgVehicles
{
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};
	class GVAR(Module): Module_F {
		scope = 2;
		displayName = $STR_ACE_NameTags_Title;
		icon = QUOTE(PATHOF(data\module_icon.paa));
		category = "ACEMisc";
		function = QUOTE(FUNC(initalizeModule));
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments	{
			class enableModule {
				displayName = $STR_ACE_NameTags_Arg_enable;
				description = $STR_ACE_NameTags_Arg_enable_Desc;
				typeName = "BOOL";
				defaultValue = 0;
			};
			class indirectDistance {
				displayName = $STR_ACE_NameTags_Arg_indirectDistance;
				description = $STR_ACE_NameTags_Arg_indirectDistance_Desc;
				typeName = "NUMBER";
				defaultValue = 7.5;
			};
			class cursorTargetDistance {
				displayName = $STR_ACE_NameTags_Arg_directDistance;
				description = $STR_ACE_NameTags_Arg_directDistance_Desc;
				typeName = "NUMBER";
				defaultValue = 20;
			};
			class allowDifferentSides {
				displayName = $STR_ACE_NameTags_Arg_differentSides;
				description = $STR_ACE_NameTags_Arg_differentSides_Desc;
				typeName = "BOOL";
				defaultValue = 0;
			};
			class enableSoundWaves {
				displayName = $STR_ACE_NameTags_Arg_soundWaves;
				description = $STR_ACE_NameTags_Arg_soundWaves_Desc;
				typeName = "BOOL";
				defaultValue = 0;
			};
		};
		class ModuleDescription {
			description = $STR_ACE_NameTags_ModuleDesc;
			sync[] = {};
		};
	};
};