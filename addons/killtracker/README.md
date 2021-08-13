ace_killtracker
============

Tracks deaths/kills and logs to the end mission disaplay. Attemps to log kills from ace_medical by using ace_medical_lastDamageSource.

Note: Requires config setup in a mission's description.ext - has no effect if mission is not setup correctly.

```powershell
    class CfgDebriefingSections {
        class acex_killTracker {
            title = "ACEX Killed Events";
            variable = "acex_killTracker_outputText";
        };
    };
```

## Maintainers

The people responsible for merging changes to this component or answering potential questions.

- [PabstMirror](https://github.com/PabstMirror)
