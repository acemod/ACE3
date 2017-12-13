class Cfg3DEN {
    class EventHandlers {
        class ADDON {
            onMissionPreviewEnd = QUOTE([] spawn {waitUntil {!isNil QQFUNC(initTrench3DEN)}; call FUNC(initTrench3DEN)});
            onMissionLoad = QUOTE([] spawn {waitUntil {!isNil QQFUNC(initTrench3DEN)}; call FUNC(initTrench3DEN)});
        };
    };
};
