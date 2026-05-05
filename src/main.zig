const std = @import("std");

const Signal = struct {
    demand: i32,
    capacity: i32,
    latency: i32,
    risk: i32,
    weight: i32,
};

const threshold: i32 = 176;
const risk_penalty: i32 = 4;
const latency_penalty: i32 = 2;
const weight_bonus: i32 = 4;

fn score(signal: Signal) i32 {
    return signal.demand * 2 + signal.capacity + signal.weight * weight_bonus
        - signal.latency * latency_penalty - signal.risk * risk_penalty;
}

fn classify(signal: Signal) []const u8 {
    return if (score(signal) >= threshold) "accept" else "review";
}

test "fixture decisions" {
    const signal_case_1 = Signal{ .demand = 57, .capacity = 91, .latency = 21, .risk = 7, .weight = 11 };
    try std.testing.expectEqual(@as(i32, 179), score(signal_case_1));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_1), "accept"));
    const signal_case_2 = Signal{ .demand = 92, .capacity = 76, .latency = 10, .risk = 9, .weight = 9 };
    try std.testing.expectEqual(@as(i32, 240), score(signal_case_2));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_2), "accept"));
    const signal_case_3 = Signal{ .demand = 96, .capacity = 91, .latency = 14, .risk = 7, .weight = 5 };
    try std.testing.expectEqual(@as(i32, 247), score(signal_case_3));
    try std.testing.expect(std.mem.eql(u8, classify(signal_case_3), "accept"));
}
