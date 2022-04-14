/* ----------------------------------------------------------------------------
Script: EFUNC(extension,sendData)

Description:
	Manages raw extension calls and returns values / logs errors where relevant.

Parameters:
	_command - The extension command to call [String]
	_args - The arguments to send [Array]

Returns:
	Depends

Examples:
	--- Code
	[":VERSION", []] call EFUNC(extension,sendData);
	---

Public:
	No

Author:
	Dell, Zealot
---------------------------------------------------------------------------- */
#include "script_component.hpp"

params ["_data", [], [[]]];

_r = _data joinString ",";
ACMI(_r);

// params ["_command","_args"];

// private _dllName = "OcapReplaySaver2";

// private _res = _dllName callExtension [_command, _args];

// _res params ["_result","_returnCode","_errorCode"];

// if (_errorCode != 0 || _returnCode != 0) then {
//   textLogFormat ["Error when calling extension: %1", [_result, _returnCode, _errorCode, _command, _args]];
// };

// if (
// 	_command isEqualTo ":VERSION:" &&
// 	_result isEqualType ""
// ) then {parseSimpleArray _result};