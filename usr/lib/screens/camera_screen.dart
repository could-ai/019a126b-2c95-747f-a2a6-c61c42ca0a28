import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isRecording = false;
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final status = await Permission.camera.request();
    final micStatus = await Permission.microphone.request();

    if (status.isGranted && micStatus.isGranted) {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _controller = CameraController(cameras[0], ResolutionPreset.high);
        await _controller!.initialize();
        setState(() {
          _hasPermission = true;
        });
      }
    }
  }

  Future<void> _recordVideo() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    try {
      setState(() {
        _isRecording = true;
      });

      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/video_${DateTime.now().millisecondsSinceEpoch}.mp4';

      await _controller!.startVideoRecording();
      await Future.delayed(const Duration(seconds: 5)); // Record for 5 seconds as demo
      final file = await _controller!.stopVideoRecording();

      setState(() {
        _isRecording = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Video recorded and saved')),
      );

      Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _isRecording = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasPermission) {
      return const Scaffold(
        body: Center(
          child: Text('Camera permission denied'),
        ),
      );
    }

    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller!),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: _isRecording ? null : _recordVideo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRecording ? Colors.red : const Color(0xFF1877F2),
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                ),
                child: Text(
                  _isRecording ? 'Recording...' : 'Record',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}