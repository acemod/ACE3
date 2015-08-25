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
        ace_reloadlaunchers_enabled = 1;  // Allow your buddies reloading for you (0-disabled, 1-enabled)
    };
};
```
