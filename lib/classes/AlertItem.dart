// ignore_for_file: file_names

class AlertItem {
  final String title;
  final String description;
  final int alertLevel;           // colors to use 
  final int alertType;            // is it Form Subisison Error, or other?
  final String alertAction;       // what to do?
  final String details;           // time and details


  const AlertItem({
    required this.title,
    required this.description,
    required this.alertLevel,     
    required this.alertType,      
    required this.alertAction,    
    required this.details,        
  });
}