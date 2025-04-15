const std = @import("std");

pub fn main() !void {
    // Get stdout
    const stdout = std.io.getStdOut().writer();
    
    // The text to print
    const text = "hello world";
    
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
    
    // Print each character with a different color
    for (text, 0..) |char, i| {
        // Select color based on position (cycle through colors)
        const color_index = i % colors.len;
        const color = colors[color_index];
        
        // Print the colored character
        try stdout.print("{s}{c}", .{ color, char });
    }
    
    // Reset the color after printing all characters
    try stdout.print("{s}\n", .{reset});
}
