class Health{
  final bool ok;
  final String service;
  final String message;
  final String timestamp;

  Health({
    required this.ok,
    required this.service,
    required this.message,
    required this.timestamp,
  });
  
  factory Health.fromJson(Map<String, dynamic> json){
    return Health(
      ok: json['ok'] ?? '', 
      service: json['service'] ?? '', 
      message: json['message'] ?? '', 
      timestamp: json['timestamp'] ?? ''
    );
  }
}