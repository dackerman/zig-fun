const std = @import("std");
const time = std.time;

pub fn main() !void {
    // Get stdout
    const stdout = std.io.getStdOut().writer();
    
    // Parse command line arguments
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);
    
    // The text to print (default or from command line)
    const text = if (args.len > 1) args[1] else "hello world";
    
    // ANSI escape sequence for colors (foreground colors 31-36)
    const colors = [_][]const u8{
        "\x1b[31m", // Red
        "\x1b[33m", // Yellow
        "\x1b[32m", // Green
        "\x1b[36m", // Cyan
        "\x1b[34m", // Blue
        "\x1b[35m", // Magenta
    };
    
    // ANSI code to reset text formatting
    const reset = "\x1b[0m";
    
    // Animation parameters
    const animation_frames = 30;
    const delay_ms = 100; // milliseconds between frames
    
    // Clear screen before starting animation
    try stdout.print("\x1b[2J\x1b[H", .{});
    
    // Animation loop
    var frame: usize = 0;
    while (frame < animation_frames) : (frame += 1) {
        // Move cursor to start position
        try stdout.print("\x1b[H", .{});
        
        // Print each character with a different color
        for (text, 0..) |char, i| {
            // Select color based on position and current frame (cycle through colors)
            const color_index = (i + frame) % colors.len;
            const color = colors[color_index];
            
            // Print the colored character
            try stdout.print("{s}{c}", .{ color, char });
        }
        
        // Reset the color after printing all characters
        try stdout.print("{s}", .{reset});
        
        // Wait before next frame
        time.sleep(time.ns_per_ms * delay_ms);
    }
    
    // Print a final newline
    try stdout.print("\n", .{});
}
