class CfgFunctions {
	class CSE {
		class Carry	{
			file = "cse\cse_f_states\carry\functions";
			class carryObj { recompile = 1; };
			class carriedByObj { recompile = 1; };
			class getCarriedObj { recompile = 1; };
			class getCarriedBy { recompile = 1; };
			class beingCarried { recompile = 1; };
			class setCarriedBy { recompile = 1; }; /* Should not be used by other developers */
		};
		class Unconscious {
			file = "cse\cse_f_states\unconscious\functions";
			class setUnconsciousState { recompile = 1; };
			class isUnconscious { recompile = 1; };
			class getUnconsciousCondition { recompile = 1; };
			class registerUnconsciousCondition { recompile = 1; };
			class setCaptiveSwitch { recompile = 1; };
			class moveToTempGroup { recompile = 1; };
			class canGoUnconsciousState { recompile = 1; };
			class setWeaponsCorrectUnconscious { recompile = 1; };
		};
		class Visual {
			file = "cse\cse_f_states\visual\functions";
			class effectPain { recompile = 1; };
			class effectBleeding { recompile = 1; };
			class effectBlackOut { recompile = 1; };
		};
		class Movement {
			file = "cse\cse_f_states\movement\functions";
			class limitMovementSpeed { recompile = 1; };
			class limitSpeed { recompile = 1; };
		};	
		class Arrest {
			file = "cse\cse_f_states\arrest\functions";
			class setArrestState { recompile = 1; };
			class isArrested { recompile = 1; };
		};
		class LoadPerson {
			file = "cse\cse_f_states\LoadPerson\functions";
			class loadPerson_F { recompile = 1; };
			class loadPersonLocal_F {recompile = 1; };
			class makeCopyOfBody_F { recompile = 1; };
			class makeCopyOfBodyLocal_F { recompile = 1; };
			class unloadPerson_F { recompile = 1; };
			class cleanUpCopyOfBody_F { recompile = 1; };
		};
	};
};