class AppConstants {
  static const String supabaseUrl = 'https://lmmbsloglbyxrdngujvh.supabase.co';
  static const String supabaseAnnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxtbWJzbG9nbGJ5eHJkbmd1anZoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMzNzM0MTIsImV4cCI6MjA3ODk0OTQxMn0.5SdoHxWh_OJlCpxwq0UD3YNMQEKszTxb8yiXxjP5n1c';

  static const String tasksBoxName = 'tasks_box';
  static const String syncQueueBoxName = 'sync_queue_box';

  static const Duration syncInterval = Duration(minutes: 5);
  static const Duration syncRetryDelay = Duration(seconds: 30);

  static const String tasksTableName = 'tasks';
}
