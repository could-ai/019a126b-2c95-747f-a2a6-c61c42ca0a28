import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isReady = false;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameraStatus = await Permission.camera.request();
    final micStatus = await Permission.microphone.request();

    if (cameraStatus.isGranted && micStatus.isGranted) {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _controller = CameraController(cameras[0], ResolutionPreset.high);
        await _controller!.initialize();
        if (!mounted) return;
        setState(() {
          _isReady = true;
        });
      }
    } else {
      setState(() {
        _isReady = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (!_controller!.value.isInitialized) {
      return;
    }
    if (_isRecording) {
      try {
        final file = await _controller!.stopVideoRecording();
        setState(() => _isRecording = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Video recorded to ${file.path}')),
          );
          Navigator.of(context).pop();
        }
      } catch (e) {
        // Handle error
      }
    } else {
      try {
        await _controller!.startVideoRecording();
        setState(() => _isRecording = true);
      } catch (e) {
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady || _controller == null || !_controller!.value.isInitialized) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: _isReady == false
              ? const Text('No camera/microphone permission',
                  style: TextStyle(color: Colors.white))
              : const CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: CameraPreview(_controller!)),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _toggleRecording,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _isRecording ? Colors.red : const Color(0xFF1877F2),
                    padding: const EdgeInsets.all(16),
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    _isRecording ? 'Stop' : 'Record',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
