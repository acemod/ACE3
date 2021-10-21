{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Validate SQF",
            "command": "${config:python.pythonPath}",
            "options": {
                "cwd": "${workspaceFolder}/tools"
            },
            "args": [
                "sqf_validator.py"
            ]
        },
        {
            "label": "Validate Config",
            "command": "${config:python.pythonPath}",
            "options": {
                "cwd": "${workspaceFolder}/tools"
            },
            "args": [
                "config_style_checker.py"
            ]
        },
        {
            "label": "Validate Stringtables",
            "command": "${config:python.pythonPath}",
            "options": {
                "cwd": "${workspaceFolder}/tools"
            },
            "args": [
                "stringtable_validator.py"
            ]
        },
        {
            "label": "Check Strings",
            "command": "${config:python.pythonPath}",
            "options": {
                "cwd": "${workspaceFolder}/tools"
            },
            "args": [
                "check_strings.py"
            ]
        },
        {
            "label": "SQFVM Checker",
            "command": "${config:python.pythonPath}",
            "options": {
                "cwd": "${workspaceFolder}/tools"
            },
            "args": [
                "sqfvmChecker.py"
            ]
        },
        {
            "label": "Test All",
            "dependsOn": [
                "Validate SQF",
                "Validate Config",
                "Validate Stringtables",
                "Check Strings",
                "SQFVM Checker"
            ],
            "group": {
                "kind": "test",
                "isDefault": true
            },
        },
        {
            "label": "Build: make.py (pboProject)",
            "command": "${config:python.pythonPath}",
            "options": {
                "cwd": "${workspaceFolder}/tools"
            },
            "args": [
                "make.py", "ci"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            }
        },
        {
            "label": "Build: Hemtt Release",
            "command": "hemtt.exe",
            "options": {
                "cwd": "${workspaceFolder}"
            },
            "args": [
                "build", "--release", "--ci"
            ],
            "group": "build"
        }
    ]
}