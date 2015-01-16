class Combat_Space_Enhancement
{
	class EventHandlers 
	{
		class PostInit_EventHandlers 
		{
			class cse_f_states 
			{
				init = " call compile preprocessFile 'cse\cse_f_states\init.sqf';";
			};
		};
	};


	class CustomEventHandlers {
		class setUnconsciousState {}; // [unit, bool]
		class setArrestState {}; // [unit, bool]
		class carryObject {}; // [_unit, _to, _fallDown],"carryObject"

		class carryObjectDropped {
			class cleanUpCopiesAfterDrag { //  [unit, droppedObject]
				onCall = "[_this select 1] call cse_fnc_cleanUpCopyOfBody_f;";
			};
		}; 
	};
};