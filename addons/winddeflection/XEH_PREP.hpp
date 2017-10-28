
//Check if Intercept plugin is loaded. It will register these functions by itself if it is.
if (isNil {uiNamespace getVariable QGVAR(interceptPlugin)}) then {
    PREP(handleFired);
    PREP(updateTrajectoryPFH);
};
PREP(initModuleSettings);
