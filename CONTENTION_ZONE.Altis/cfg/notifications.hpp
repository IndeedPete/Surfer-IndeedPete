class CfgNotifications
{
	class Default
	{
		title = ""; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
 
	// Tasks
	class TaskCreated
	{
		title = "TASK ASSIGNED";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconcreated_ca.paa";
		description = "%2";
		color[] = {1,1,1,1};
		priority = 7;
	};	
	class TaskAssigned
	{
		title = "CURRENT TASK";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%2";
		color[] = {1,1,1,1};
		priority = 7;
	};	
	class TaskCanceled
	{
		title = "TASK CANCELED";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconcanceled_ca.paa";
		description = "%2";
		color[] = {0.75,0.75,0.75,1};
		priority = 7;
	};	
	class TaskFailed
	{
		title = "TASK FAILED";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconfailed_ca.paa";
		description = "%2";
		color[] = {1,0.1,0,1};
		priority = 7;
	};
	
	class TaskSucceeded
	{
		title = "TASK SUCCEEDED";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcondone_ca.paa";
		description = "%2";
		color[] = {0.6,0.8,0.4,1};
		priority = 7;
	};	
	
	// Anomalies
	class AnomalyScanned
	{
		title = "ANOMALY SCANNED";
		iconPicture = "\A3\ui_f\data\map\diary\signal_ca.paa";
		description = "%1";
		color[] = {0.6,0.8,0.4,1};
		priority = 7;
	};	
	
	// Shop
	class MoneyAdded
	{
		title = "ADDED MONEY";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcondone_ca.paa";
		description = "+%1€";
		color[] = {0.6,0.8,0.4,1};
		priority = 7;
	};		
	class MoneySpent
	{
		title = "SPENT MONEY";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconfailed_ca.paa";
		description = "-%1€";
		color[] = {1,0.1,0,1};
		priority = 7;
	};
};