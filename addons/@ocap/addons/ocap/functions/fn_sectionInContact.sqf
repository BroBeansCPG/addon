params ["_firer", "_grpID"];

_grpID setVariable ["ocap_lastContact", 1];
_grpID setVariable ["ocap_inContact", true];
_start = round cba_missionTime;

[":Section:Contact:", [
	ocap_captureFrameNo, //0 - Frame
	_grpID, //1 - Group Name
	_firer, //2 - Who
	str side _grpID, //3 - Side
	"#FF0000", //4 - Event Colour
	getPosAtl _firer, //5 - Where
	_start // 6 - Contact Start Time
]] call ocap_fnc_extension;

private _last = 1;
while {(_grpID getVariable "ocap_lastContact") < 89} do {
	sleep 10;
	_last = _grpID getVariable "ocap_lastContact";
	_grpID setVariable ["ocap_lastContact", _last + 10];
};
_end = round cba_missionTime;
_dur = (_end - _start) / 60;

[":Contact:Report:", [
	ocap_frameCaptureNo, //0 - Frame
	_grpID, //1 - Group Name
	_firer, //2 - Who initiated first contact
	str side _grpID, //3 - Side
	"#FF0000", // 4 - Event Colour
	getPosAtl leader _grpID, //5 - Where
	_start, //6 - Start
	_dur, //7 - Duration
	_grpID getVariable "ocap_sicFriendlyHits", // 8 - Friendly Hits
	_grpID getVariable "ocap_sicEnemyHits" //9 - Enemy Hits

]] call ocap_fnc_extension;
_grpID setVariable ["ocap_inContact", false];