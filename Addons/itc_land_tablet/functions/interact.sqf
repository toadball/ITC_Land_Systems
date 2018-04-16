params ["_action", "_value"];
_vehicle = (vehicle player);

if(_action == "app" && !isNil{_value}) exitWith {
  if(count (_vehicle getVariable "apps") > _value) then {
    _newApp = (_vehicle getVariable "apps") # _value;
    if(!isNil{_newApp}) then {
      _vehicle setVariable ["app", _newApp];
    };
  };
};

_app = _vehicle getVariable "app";
_page = [_action] call itc_land_tablet_fnc_appInteract;
