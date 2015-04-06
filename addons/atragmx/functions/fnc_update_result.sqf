#include "script_component.hpp"

private ["_elevationAbs", "_elevationRel", "_elevationCur", "_windageAbs", "_windageRel", "_windageCur", "_lead", "_elevationScopeStep", "_windageScopeStep"];
_elevationAbs = (GVAR(ATragMX_elevationOutput) select GVAR(ATragMX_currentTarget));
_windageAbs = (GVAR(ATragMX_windageOutput) select GVAR(ATragMX_currentTarget));

_elevationCur = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 10;
_windageCur = (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 11;

_elevationRel = _elevationAbs - _elevationCur;
_windageRel = _windageAbs - _windageCur;

_lead = (GVAR(ATragMX_leadOutput) select GVAR(ATragMX_currentTarget));

switch ((GVAR(ATragMX_currentScopeUnit) select GVAR(ATragMX_currentTarget))) do
{
    case 0:
    {
		_elevationAbs = _elevationAbs / 3.38;
		_windageAbs = _windageAbs / 3.38;
		
		_elevationRel = _elevationRel / 3.38;
		_windageRel = _windageRel / 3.38;
		
		_elevationCur = _elevationCur / 3.38;
		_windageCur = _windageCur / 3.38;
    };
	
    case 2:
    {
		_elevationAbs = _elevationAbs * 1.047;
		_windageAbs = _windageAbs * 1.047;
		
		_elevationRel = _elevationRel * 1.047;
		_windageRel = _windageRel * 1.047;
		
		_elevationCur = _elevationCur * 1.047;
		_windageCur = _windageCur * 1.047;
    };
	
	case 3:
    {
		_elevationScopeStep = ((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 7);
		_windageScopeStep = ((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 8);
		
		_elevationAbs = Round(_elevationAbs / _elevationScopeStep);
		_windageAbs = Round(_windageAbs / _windageScopeStep);
		
		_elevationRel = Round(_elevationRel / _elevationScopeStep);
		_windageRel = Round(_windageRel / _windageScopeStep);
		
		_elevationCur = Round(_elevationCur / _elevationScopeStep);
		_windageCur = Round(_windageCur / _windageScopeStep);
    };
};

ctrlSetText [400, Str(Round(_elevationAbs * 100) / 100)];
ctrlSetText [401, Str(Round(_elevationRel * 100) / 100)];
ctrlSetText [402, Str(Round(_elevationCur * 100) / 100)];

ctrlSetText [410, Str(Round(_windageAbs * 100) / 100)];
ctrlSetText [411, Str(Round(_windageRel * 100) / 100)];
ctrlSetText [412, Str(Round(_windageCur * 100) / 100)];

ctrlSetText [420, Str(Round(_lead * 100) / 100)];
