params ["_vehicle"];

if !(GVAR(activAPS)) exitWith {};

if (
    _vehicle in (missionNamespace getVariable [QGVAR(whitelist), []]) ||
    {
        _vehicle isKindOf "Tank" &&
        !(_vehicle in (missionNamespace getVariable [QGVAR(blacklist), []]))
    }
)then {
    private _vehicles = missionNamespace getVariable [QGVAR(activVehicles), []];
    _vehicles pushBackUnique _vehicle;
    missionNamespace setVariable [QGVAR(activVehicles), _vehicles, false];

    if !(missionNamespace getVariable [QGVAR(pfhActiv), false]) then {
        [] call FUNC(mainPFH);
    }:
};
