# Rainbow Text Animator

A minimal yet effective command-line text animator written in Zig that displays text with animated rainbow colors.

![Rainbow Text Animation](generated-icon.png)

## Features

- Displays text with smooth color transitions
- Accepts custom text via command-line arguments
- Implements animation using ANSI color codes
- Lightweight and fast Zig implementation

## Usage

Build and run with the default "hello world" message:

```bash
zig build run
```

Or specify your own text:

```bash
zig build run -- "Your custom message"
```

## Custom Build Steps

The project includes a custom build step for quick demos:

```bash
zig build custom
```

This runs the program with the text "Rainbow Text Animation".

## How It Works

The program creates a rainbow effect by:
1. Cycling through ANSI color codes
2. Applying different colors to each character
3. Shifting colors across characters in each animation frame
4. Using terminal control sequences for screen positioning

## Requirements

- Zig compiler (tested with version 0.12.0)
- Terminal with ANSI color support

## Development

Clone the repository and make your own modifications:

```bash
# Clone repository
git clone [repository-url]
cd rainbow-hello

# Make your changes to src/main.zig
# Build and test
zig build run
```

## License

MIT

---

*Rainbow Text Animator: Simple elegance in terminal output.*