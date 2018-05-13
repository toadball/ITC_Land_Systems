["itc_land_onLoad_RscGunnerSightSPH", {

	[{
		params ["_args","_pfID"];
		disableSerialization;
		private _display = uiNamespace getVariable ["ITC_Land_RscGunnerSightSPH",displayNull];
		if (isNull _display) exitWith {};

		private _vehRole = ACE_player call CBA_fnc_vehicleRole;
		//hide control group if the camera is anything but GUNNER or the player is no longer controlling the turret
		//also remove PFH in this case.
		if ( (cameraView != "GUNNER") || ( _vehRole != "GUNNER") ) then {
			if (cameraView != "GUNNER") then {
				(_display displayCtrl 81001) ctrlShow false;
			};
			if (_vehRole != "GUNNER") then {
				(_display displayCtrl 81001) ctrlShow false;
				[_pfID] call CBA_fnc_removePerFrameHandler;
			};
		} else {

			//make sure control group is visible
			(_display displayCtrl 81001) ctrlShow true;

			//get vehicle
		   private _veh = vehicle ACE_player;

		   //Get current azimuth
		   private _weaponDirVector = _veh weaponDirection currentWeapon _veh; //Vector (array)
		   private _weaponDir = (_weaponDirVector call CBA_fnc_vect2Polar) select 1;

			 //Get current quadrant
			 private _weaponQuad = (_weaponDirVector call CBA_fnc_vect2Polar) select 2;

			 //check if camera is pointed at the ground
			 private _testSeekerPosASL = AGLtoASL (positionCameraToWorld [0,0,0]);
			 private _testSeekerDir = _testSeekerPosASL vectorFromTo (AGLtoASL (positionCameraToWorld [0,0,1]));
			 private _testPoint = _testSeekerPosASL vectorAdd (_testSeekerDir vectorMultiply viewDistance);
			 if ((terrainIntersectASL [_testSeekerPosASL, _testPoint]) || {lineIntersects [_testSeekerPosASL, _testPoint]}) then {
					 //it's not pointing at the ground, which means the shell will now fly in a different direction
					 private _lookVector = ((positionCameraToWorld [0,0,0]) call ace_common_fnc_positionToASL) vectorFromTo ((positionCameraToWorld [0,0,10]) call ace_common_fnc_positionToASL);
					 _weaponDir = ((_lookVector select 0) atan2 (_lookVector select 1));
					 private _upVectorDir = (((vectorUp _veh) select 0) atan2 ((vectorUp _veh) select 1));
					 private _elevationDiff = (cos (_weaponDir - _upVectorDir)) * acos ((vectorUp _veh) select 2);
					 _weaponQuad = ((180 / PI) * (_veh animationPhase "mainGun")) - _elevationDiff;
					 if(_weaponDir <= 0) then {_weaponDir = _weaponDir + 360};
			 };
			 private _displayedQuad = [_weaponQuad, "mil4", true] call ace_mk6mortar_fnc_dev_formatNumber;
		   private _displayedDir = [_weaponDir, "mil4", true] call ace_mk6mortar_fnc_dev_formatNumber; //Take weapon direction in degrees, convert to mils and format as 4 figure string
			//display current azimuth


			//Get mission azimuth
			private _displayedMISazi = "----";
			private _slnIndex = _veh getVariable "itc_land_tablet_fcs_solutions_index";
			if !(isNil {_slnIndex}) then {
				private _sln = _veh getVariable "itc_land_tablet_fcs_solutions";
				_sln = _sln select _slnIndex;
				private _MISazi = _sln select 1;
				_displayedMISazi = [_MISazi, 4, 0] call CBA_fnc_formatNumber;
			//_solution params ["_charge", "_az", "_df", "_qd", "_tof", "_impVel", "_impAng", "_maxOrd", "_dist"];
			//_vehicle setVariable ["itc_land_tablet_fcs_solutions", []];
			//_vehicle setVariable ["itc_land_tablet_fcs_solutions_index", 0];
			};
			//display azimuth values
			(_display displayCtrl 81016) ctrlSetText _displayedMISazi;
		    (_display displayCtrl 81014) ctrlSetText _displayedDir;

			//Get mission quadrant
			private _displayedMISquad = "----";
			_slnIndex = _veh getVariable "itc_land_tablet_fcs_solutions_index";
			if !(isNil {_slnIndex}) then {
				private _sln = _veh getVariable "itc_land_tablet_fcs_solutions";
				_sln = _sln select _slnIndex;
				private _MISquad = _sln select 3;
				_displayedMISquad = [_MISquad, 4, 0] call CBA_fnc_formatNumber;
			//_solution params ["_charge", "_az", "_df", "_qd", "_tof", "_impVel", "_impAng", "_maxOrd", "_dist"];
			//_vehicle setVariable ["itc_land_tablet_fcs_solutions", []];
			//_vehicle setVariable ["itc_land_tablet_fcs_solutions_index", 0];
			};
			(_display displayCtrl 81021) ctrlSetText _displayedMISquad;
		    (_display displayCtrl 81019) ctrlSetText _displayedQuad;
			
			
			//Autoloader and Gun Status Readout
			//Gun Status
			if (isNil "itc_land_SPHammoHandler_status") then {
				if (currentMagazine vehicle ace_player isKindOf ["itc_land_how_mag", configFile >> "CfgMagazines"]) then {
					itc_land_SPHammoHandler_status = "READY TO FIRE";
					//ctrlSetText [86011, itc_land_SPHammoHandler_status];
				} else {
					itc_land_SPHammoHandler_status	= "WAITING";
					//ctrlSetText [86011, itc_land_SPHammoHandler_status];
				};
			};
			(_display displayCtrl 81022) ctrlSetText (format ["STATUS: %1",itc_land_SPHammoHandler_status]);
			
			//Ammo to load
			
			if (!(isNil "itc_land_sphloadersettings") && {count itc_land_sphloadersettings > 0}) then {
				(_display displayCtrl 81023) ctrlSetText (format ["LOAD: %1",((itc_land_sphloadersettings # 0) # 0)]);
				(_display displayCtrl 81024) ctrlSetText (format ["FUZE: %1", toUpper ((itc_land_sphloadersettings # 1) # 0)]);
				(_display displayCtrl 81025) ctrlSetText (format ["GUIDANCE: %1", toUpper ((itc_land_sphloadersettings # 2) # 0)]);				
			} else {
				(_display displayCtrl 81023) ctrlSetText "LOAD: -- N/A --";
				(_display displayCtrl 81024) ctrlSetText "FUZE: -- N/A --";
				(_display displayCtrl 81025) ctrlSetText "GUIDANCE: -- N/A --";				
			};		
		};
	}, 0, []] call CBA_fnc_addPerFrameHandler;


}] call CBA_fnc_addEventHandler;