/*
Name: taskhint
Author: IndeedPete
Purpose: Creates task hint.
----------
Parameters:
_task - STRING: Name of the task. - "myLittleTask"
*/

private "_taskParams";

_task 			 = _this;
_taskDescription = ((_task call BIS_fnc_taskDescription) select 1) select 0;
_taskStatus		 = toUpper(_task call BIS_fnc_taskState);

_taskParams = switch (_taskStatus) do
{
	case "CREATED":
	{
		["TaskCreated",["", _taskDescription]]
	};

	case "ASSIGNED":
	{
		["TaskAssigned",["", _taskDescription]]
	};

	case "SUCCEEDED":
	{
		["TaskSucceeded",["", _taskDescription]]
	};

	case "FAILED":
	{
		["TaskFailed",["", _taskDescription]]
	};

	case "CANCELED":
	{
		["TaskCanceled",["", _taskDescription]]
	};
};

_taskParams call bis_fnc_showNotification;