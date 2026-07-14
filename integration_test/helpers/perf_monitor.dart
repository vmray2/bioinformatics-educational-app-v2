import 'dart:io';
import 'package:flutter/services.dart'; 

class PerfMonitor {
  int _startMemory = 0;
  int _endMemory = 0;
  late Stopwatch _cpuStopwatch;

  /// Starts monitoring memory and CPU cycles before an interaction begins.
  void startSection() {
    // ignore: invalid_use_of_protected_member
    ServicesBinding.instance.handleMemoryPressure();
    
    // Capture the Resident Set Size (RSS) memory allocation in bytes
    _startMemory = ProcessInfo.currentRss;
    
    _cpuStopwatch = Stopwatch()..start();
  }

  Map<String, dynamic> endSection(String sectionName) {
    _cpuStopwatch.stop();
    _endMemory = ProcessInfo.currentRss;

    final memoryDeltaBytes = _endMemory - _startMemory;
    final memoryDeltaMB = memoryDeltaBytes / (1024 * 1024);
    final totalAllocatedMB = _endMemory / (1024 * 1024);

    return {
      'section': sectionName,
      'duration_ms': _cpuStopwatch.elapsedMilliseconds,
      'baseline_memory_mb': (_startMemory / (1024 * 1024)).toStringAsFixed(2),
      'peak_memory_mb': totalAllocatedMB.toStringAsFixed(2),
      'memory_delta_mb': memoryDeltaMB.toStringAsFixed(2),
    };
  }
}