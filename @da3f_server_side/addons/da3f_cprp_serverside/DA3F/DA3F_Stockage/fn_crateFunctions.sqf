/*
fn_crateFunctions.sqf
Original Author  : Leg's.
Edit & adapte by [DA3F] Aroun Le BriCodeur
Merci à toi copain de m'avoir donné ce script il y a déjà bien longtemps...
Adaptation faites pour la save/load des items virtuel de la mission
et changement du tag des fichiers ainsi que la table SQL . nom des fichiers inchangé
Tag original : SFI
nom de table original : create
ajout de ce commentaire par moi même (Aroun) pour rendre à césar ce qui lui appartient ;)
*/
_mode = _this select 0;
_name = _this select 1;
_gear = _this select 2;
switch (_mode) do
{
	// insert
	case 0:
	{
		_name = call compile _name;
		_result = format ["SELECT Name FROM stockage WHERE name='%1'",_name];
		_thread = [_result,2] call DB_fnc_asyncCall;

		_thread = format _thread;
		if (_thread == "") then {
			_query = format ["INSERT INTO stockage (Name, Items,Weapons,Magazines,Backpacks) VALUES('%1', '""[]""', '""[]""', '""[]""', '""[]""')",_name];
	        [_query,1] call DB_fnc_asyncCall;
    	};
	};

	// update
	case 11:
	{
		_query = format ["UPDATE stockage SET Items='%1' WHERE Name='%2'",_gear,_name];
        [_query,1] call DB_fnc_asyncCall;
	};

	// update
	case 12:
	{
		_query = format ["UPDATE stockage SET Weapons='%1' WHERE Name='%2'",_gear,_name];
        [_query,1] call DB_fnc_asyncCall;
	};

	// update
	case 13:
	{
		_query = format ["UPDATE stockage SET Magazines='%1' WHERE Name='%2'",_gear,_name];
        [_query,1] call DB_fnc_asyncCall;
	};

	// update
	case 14:
	{
		_query = format ["UPDATE stockage SET Backpacks='%1' WHERE Name='%2'",_gear,_name];
        [_query,1] call DB_fnc_asyncCall;
	};

	// Select
	case 21:
	{
		_query = format ["SELECT Items FROM stockage WHERE Name='%1'",_name];
        _gear = [_query,2] call DB_fnc_asyncCall;
        _gear;
	};
	// Select
	case 22:
	{
		_query = format ["SELECT Weapons FROM stockage WHERE Name='%1'",_name];
        _gear = [_query,2] call DB_fnc_asyncCall;
        _gear;
	};
	// Select
	case 23:
	{
		_query = format ["SELECT Magazines FROM stockage WHERE Name='%1'",_name];
        _gear = [_query,2] call DB_fnc_asyncCall;
        _gear;
	};
	// Select
	case 24:
	{
		_query = format ["SELECT Backpacks FROM stockage WHERE Name='%1'",_name];
        _gear = [_query,2] call DB_fnc_asyncCall;
        _gear;
	};
	// Select
	case 25:
	{
		_query = format ["SELECT VirtItems FROM stockage WHERE Name='%1'",_name];
        _gear = [_query,2] call DB_fnc_asyncCall;
        _gear;
	};
	// update
	case 26:
	{
		_query = format ["UPDATE stockage SET VirtItems='%1' WHERE Name='%2'",_gear,_name];
        [_query,1] call DB_fnc_asyncCall;
	};
};