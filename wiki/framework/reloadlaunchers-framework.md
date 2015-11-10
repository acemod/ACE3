---
layout: wiki
title: Reload Launchers Framework
description: Explains how to set-up launchers with ACE3 reload launchers system.
group: framework
order: 5
parent: wiki
---

## 1. Adding third party reload

```c++
class CfgWeapons {
    class MyLauncher {
        ace_reloadlaunchers_enabled = 1;  // Allow your buddies to reload your launcher (0-disabled, 1-enabled)
    };
};
```

## 2. Events

### 2.1 Listenable

Event Name | Description | Passed Parameter(s) | Locality
---------- | ----------- | ------------------- | --------
`reloadLauncher` | Launcher reloaded | `[_unit, _target, _weapon, _magazine]` | Target
