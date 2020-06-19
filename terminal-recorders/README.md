# Convert QuickTime .mov files to .mp4 files

```bash
brew install ffmpeg
```

**Example**
```bash
ffmpeg -i test1.mov -vcodec h264 -acodec mp2 test1.mp4
```