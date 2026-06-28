---
layout: wiki
title: Gesture Framework
description: Explains how to use the ACE Gesture Events
group: framework
order: 5
parent: wiki
mod: ace
version:
  major: 3
  minor: 21
  patch: 1
---

## 1. Events

### 1.1 Listenable

| Event Name | Description | Passed Parameter(s) | Locality |
| ---------- | ----------- | ------------------- | -------- |
| `ace_gesture_playGesture` | Raised just after Gesture is triggered | `[_gesture]` | Local |
