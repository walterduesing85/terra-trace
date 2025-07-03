import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

class PhotoSlideshow extends StatefulWidget {
  final double constraints;
  
  const PhotoSlideshow({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  State<PhotoSlideshow> createState() => _PhotoSlideshowState();
}

class _PhotoSlideshowState extends State<PhotoSlideshow> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  VideoPlayerController? _videoController;
  bool _isVideoPlaying = false;
  
  final List<String> _images = [
    'assets/images/gallery_team_vulcano.jpeg',
    'assets/images/gallery_workshop_1.jpg',
    'assets/images/gallery_measure_video.mp4',
    'assets/images/gallery_aya_walt.jpeg',
    'assets/images/gallery_wd_sticker.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _initVideoControllerIfNeeded(_currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) async {
    setState(() {
      _currentIndex = index;
    });
    if (index < _images.length) {
      await _initVideoControllerIfNeeded(index);
    }
  }

  Future<void> _initVideoControllerIfNeeded(int index) async {
    final isVideo = _images[index].toLowerCase().endsWith('.mp4');
    if (isVideo) {
      _videoController?.dispose();
      _videoController = VideoPlayerController.asset(_images[index]);
      try {
        await _videoController!.initialize();
        _videoController!.setVolume(0.0);
        setState(() {});
        _videoController!.setLooping(true);
        _videoController!.play();
        _isVideoPlaying = true;
      } catch (e) {
        setState(() {
          _isVideoPlaying = false;
        });
        debugPrint('Video failed to load: $e');
      }
    } else {
      _videoController?.pause();
      _videoController?.dispose();
      _videoController = null;
      _isVideoPlaying = false;
    }
  }

  void _toggleVideoPlayback() {
    if (_videoController != null) {
      setState(() {
        if (_videoController!.value.isPlaying) {
          _videoController!.pause();
          _isVideoPlaying = false;
        } else {
          _videoController!.play();
          _isVideoPlaying = true;
        }
      });
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  void _goToNext() {
    if (_currentIndex < _images.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isVideo = _images[_currentIndex].toLowerCase().endsWith('.mp4');
    return Container(
      height: widget.constraints > 700 ? 520 : 320,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    final isVideo = _images[index].toLowerCase().endsWith('.mp4');
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: isVideo
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  _videoController != null && _videoController!.value.isInitialized
                                      ? AspectRatio(
                                          aspectRatio: _videoController!.value.aspectRatio,
                                          child: VideoPlayer(_videoController!),
                                        )
                                      : _videoController != null && _videoController!.value.hasError
                                          ? const Center(child: Text('Video failed to load', style: TextStyle(color: Colors.red)))
                                          : const Center(child: CircularProgressIndicator()),
                                  Positioned(
                                    bottom: 16,
                                    right: 16,
                                    child: GestureDetector(
                                      onTap: _toggleVideoPlayback,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black54,
                                        child: Icon(
                                          _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Image.asset(
                                _images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                      ),
                    );
                  },
                ),
                if (_currentIndex > 0)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, size: 32, color: Colors.black54),
                        onPressed: _goToPrevious,
                        splashRadius: 24,
                      ),
                    ),
                  ),
                if (_currentIndex < _images.length - 1)
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 32, color: Colors.black54),
                        onPressed: _goToNext,
                        splashRadius: 24,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _images.length,
              (index) => Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color.fromRGBO(213, 255, 111, 1)
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 