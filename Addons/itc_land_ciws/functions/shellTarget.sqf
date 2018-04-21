_this spawn {
  sleep 1;
  params ["", "", "", "", "_ammo", "", "_projectile", "_gunner"];
  _class = if((side _gunner) == west) then [{"itc_land_shell_b"},{"itc_land_shell_o"}];
  _class = if((side _gunner) == resistance) then [{"itc_land_shell_i"},{_class}];
  _target = _class createVehicle [0,0,1000];
  _target setPos (_projectile modelToWorld [0,-5,0]);
  _target setVelocity (velocity _projectile);
  _target setMass 0;
  _target setobjecttexture [0,""];
  createVehicleCrew _target;
  driver _target disableAI "ALL";
  gunner _target disableAI "ALL";
  [{
      (_this select 0) params ["_projectile", "_target"];
      _canIntercept = (getPosATL _projectile # 2 > 30);
      _descending = (velocity _projectile # 2 < 0);
      if (!alive _projectile || (!alive _target && _canIntercept)) exitWith {
          deleteVehicle _projectile;
          deleteVehicle _target;
          [_this select 1] call CBA_fnc_removePerFrameHandler;
      };
      if(!_canIntercept && alive _target && _descending) then {
        deleteVehicle _target;
      } else {
        _target setPos (_projectile modelToWorld [0,-5,0]);
        _target setVelocity (velocity _projectile);
      };
  }, 0, [_projectile, _target]] call CBA_fnc_addPerFrameHandler;
};
