params ["_networkId", "_loggedIn", "_votedIn"];

_object = (getUserInfo _networkId) select 10;
if (isNull _object) exitWith {};
if (_loggedIn && !_votedIn && !(_object getVariable [QGVARMAIN(hasAdminControls), true])) then {
  // if user has become admin by logging, not voting, and has not yet received adminControls per OCAP - Main > Administrators setting, add controls
  [_id] call FUNC(adminUIcontrol);
};