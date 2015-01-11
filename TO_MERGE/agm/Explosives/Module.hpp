class Module_F;
class AGM_ModuleExplosive: Module_F {
	author = "AGM Team";
	category = "AGM";
	displayName = "Explosive System";
	function = "AGM_Explosives_fnc_module";
	scope = 2;
	isGlobal = 1;
    icon = "\AGM_Explosives\UI\IconExplosives_ca.paa";
	class Arguments {
		class RequireSpecialist {
			displayName = "Require specialists?";
			//description = "Require explosive specialists to plant/disable explosives? Default: No";
			// The above distinction is commented out due to the explanation in fn_SetupExplosive.sqf
			description = "Require explosive specialists to disable explosives? Default: No";
			typeName = "BOOL";
			class values {
				class Yes {
					name = "Yes";
					value = 1;
				};
				class No {
					default = 1;
					name = "No";
					value = 0;
				};
			};
		};
		class PunishNonSpecialists {
			displayName = "Punish non-specialists?";
			description = "Increase the time it takes to complete actions for non-specialists? Default: Yes";
			typeName = "BOOL";
			class values {
				class Yes {
					default = 1;
					name = "Yes";
					value = 1;
				};
				class No {
					name = "No";
					value = 0;
				};
			};
		};
	};
};
