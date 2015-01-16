class CfgFunctions {
	class CSE {
		class Strings {
			file = "cse\cse_main\strings\functions";
			class stringCompare { recompile = 1; };
			class string_removeWhiteSpace { recompile = 1; };
		};
		class HC {
			file = "cse\cse_main\hc\functions";
			class isHC { recompile = 1; };
		};
		class Requests {
			file = "cse\cse_main\requests\functions";
			class sendRequest_f { recompile = 1; };
			class requestCallback { recompile = 1; };
			class receiveRequest { recompile = 1; };
			class onAnswerRequest { recompile = 1; };
		};
		
		class Debug {
			file = "cse\cse_main\debug\functions";
			class debug { recompile = 1; };
			class debugModule { recompile = 1; };
			class traceModule { recompile = 1; };
		};
		
		class TaskPool {
			file = "cse\cse_main\tasks\functions";
			class addTaskToPool_f { recompile = 1; };
			class removeTaskFromPool_f { recompile = 1; };
			class loopThroughPool_f { recompile = 1; };
		};
		
		class Mutex {
			file = "cse\cse_main\mutex\functions";
			class createMutex { recompile = 1; };
			class releaseMutex { recompile = 1; };
			class waitForSingleMutex { recompile = 1; };
			class waitForMultipleMutex { recompile = 1; };
			class lockMutex { recompile = 1; };
		};
		
		class Variables {
			file = "cse\cse_main\variables\functions";
			class defineVariable { recompile = 1; };
			class setVariable { recompile = 1; };
			class getVariable { recompile = 1; };
			class getAllSetVariables { recompile = 1; };
			class getVariableInfo { recompile = 1; };
			class getVariableDefault { recompile = 1; };
		};
		
		class Messages {
			file = "cse\cse_main\messages\functions";
			class sendHintTo { recompile = 1; };
			class sendMessageTo { recompile = 1; };
			class sendDisplayInformationTo { recompile = 1; };
			class sendDisplayMessageTo { recompile = 1; };
		};
		
		class Anim {
			file = "cse\cse_main\anim\functions";
			class broadcastAnim { recompile = 1; };
			class getDeathAnim { recompile = 1;	};
			class switchAnim { recompile = 1; };
			class playMoveNow { recompile = 1; };
			class localAnim { recompile = 1; };
		};
		
		class Arrays {
			file = "cse\cse_main\arrays\functions";
			class insertionSort { recompile = 1; };
			class findIf { recompile = 1; };
			class findIn { recompile = 1; };
			class findAll { recompile = 1; };
			class uniqueElementsOnly { recompile = 1; };
			class foreachDo { recompile = 1; };
			class sortAlphabeticallyBy { recompile = 1; };
		};
		
		class EquipmentLib {
			file = "cse\cse_main\equipment\functions";
			class hasMagazine { recompile = 1; };
			class useMagazine { recompile = 1; };
			class findMagazine { recompile = 1; };
			class hasItem { recompile = 1; };
			class useItem { recompile = 1; };
			class findItem { recompile = 1; };
			class getNumberMagazinesIn { recompile = 1; };
		};
		
		class Interaction {
			file = "cse\cse_main\interaction\functions";
			class registerInteractingWith { recompile = 1; };
			class getInteractionTarget { recompile = 1; };
			class isRegisteredInteractingWith { recompile = 1; };
			class unregisterInteractingWith { recompile = 1; };
			class getAllMonitoredVariables { recompile = 1; };
			class registerVariableMonitor { recompile = 1; };
			class setOnUpdateVariableEH { recompile = 1; };
			class getOnUpdateVariableEH { recompile = 1; };
			class getRegisteredMonitorVariablesOwners { recompile = 1; };
			class getMonitoredVariableName { recompile = 1; };
			class getMonitoredVariableValue { recompile = 1; };
			class setMonitoredVariableValue { recompile = 1; };
			class broadcastMonitoredVariable { recompile = 1; };
			class setCanInteract { recompile = 1; };
			class getCanInteract { recompile = 1; };
			class canInteract { recompile = 1; };
		};
		class Misc {
			file = "cse\cse_main\misc\functions";
			class resetAllDefaults_f { recompile = 1; };
			class broadcastSound3D_f { recompile = 1; };
			class getName { recompile = 1; };
			class setDead { recompile = 1; };
			class isAwake { recompile = 1; };
			class setProne { recompile = 1; };
			class isInBuilding { recompile = 1; };
			class disableKeyInput_f { recompile = 1; };
			class disableUserInput_f { recompile = 1; };
			class dropWeapon_f { recompile = 1; };
			class inWater_f { recompile = 1; };
			class setVolume_f { recompile = 1; };
			class lockVehicleOfUnitUntil { recompile = 1; };
			class closeAllDialogs_f { recompile = 1; };
			class disableAI_f { recompile = 1; };
			class moduleEnableBasicRevive { recompile = 1; };
			class switchToGroupSide_f { recompile = 1; };
			class hasItem_f { recompile = 1; };
			class getFirstObjectIntersection { recompile = 1; };
			class getFirstTerrainIntersection { recompile = 1; };
			class setHearingCapability { recompile = 1; };
			class revealObject_f { recompile = 1; };
			class getWeaponItems_f { recompile = 1; };
		};	
		class Mods {
			file = "cse\cse_main\mods\functions";
			class ALiVE_Bus_Mod { recompile = 1; };
			class isLoaded_ALiVE_Mod { recompile = 1; };
			class isModLoaded_f { recompile = 1; };
		};	


		class Config {
			file = "cse\cse_main\config\functions";
			class inheritsFrom;
		};
		class Version {
			file = "cse\cse_main\version\functions";
			class getVersion;
		};
	};
};
