# TerraTrace Website Performance Optimization Guide

## Current Optimizations Implemented

### 1. Image Preloading
- Critical images are preloaded in `initState()`
- Background images, logo, and key visuals are cached early

### 2. Video Optimization
- Videos are only loaded when the slide is active
- Video controllers are properly disposed to free memory
- Videos are muted by default

### 3. Web-Specific Optimizations
- Preload hints for critical assets
- Preconnect to external domains (LinkedIn)
- Caching headers for static assets
- Optimized viewport settings

### 4. Build Optimizations
- Skia renderer enabled for better performance
- Auto-detection for optimal rendering
- Release mode with optimizations

## Additional Recommendations

### Image Optimization
1. **Compress Images**: Use tools like TinyPNG or ImageOptim
   - Convert PNG to WebP where possible
   - Optimize JPEG quality (80-85% is usually sufficient)

2. **Resize Images**: Ensure images are not larger than needed
   - Background images: max 1920px width
   - Profile images: max 300px width
   - Gallery images: max 1200px width

### Code Splitting
1. **Lazy Load Components**: Load team sections only when needed
2. **Bundle Analysis**: Use `flutter build web --analyze-size` to identify large dependencies

### Caching Strategy
1. **Service Worker**: Implement caching for static assets
2. **CDN**: Use a CDN for faster global delivery
3. **Browser Caching**: Set appropriate cache headers

### Server Optimizations
1. **Gzip Compression**: Enable on your web server
2. **HTTP/2**: Use HTTP/2 for better performance
3. **Minification**: Ensure CSS/JS are minified

## Monitoring Performance

### Tools to Use
- **Lighthouse**: Run performance audits
- **WebPageTest**: Test loading times globally
- **Chrome DevTools**: Profile and analyze performance

### Key Metrics to Track
- First Contentful Paint (FCP): < 1.5s
- Largest Contentful Paint (LCP): < 2.5s
- Cumulative Layout Shift (CLS): < 0.1
- First Input Delay (FID): < 100ms

## Quick Wins for Immediate Improvement

1. **Optimize Large Images**: Focus on `background_01.png` and `vulcano_chamber.jpeg`
2. **Remove Unused Assets**: Clean up unused images in `pubspec.yaml`
3. **Minimize Dependencies**: Remove unused packages
4. **Use WebP Format**: Convert large images to WebP with PNG fallback

## Build Commands for Production

```bash
# Optimized build
flutter build web --release --web-renderer html --dart-define=FLUTTER_WEB_USE_SKIA=true

# Analyze bundle size
flutter build web --analyze-size

# Deploy with optimizations
make deploy-web
```

## Expected Performance Improvements

With these optimizations, you should see:
- **30-50% faster initial load times**
- **Reduced memory usage**
- **Better mobile performance**
- **Improved Core Web Vitals scores** 