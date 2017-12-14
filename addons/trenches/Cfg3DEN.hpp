class Cfg3DEN {
    class EventHandlers {
        class ADDON {
            onMissionPreviewEnd = QUOTE([] spawn {waitUntil {!isNil QQFUNC(initTrench3DEN)}; call FUNC(initTrench3DEN)}); // Don't ask me why but this function is nil when this event triggers
            onMissionLoad = QUOTE([] spawn {waitUntil {!isNil QQFUNC(initTrench3DEN)}; call FUNC(initTrench3DEN)}); // Don't ask me why but this function is nil when this event triggers
        };
    };
};
