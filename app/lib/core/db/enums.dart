/// Enums stored in the database as text (via drift `textEnum`).
/// Renaming a value is a data migration — add new values instead.
library;

enum ContentVisibility { private, public }

enum ModerationStatus { active, pending, rejected }

/// What 100 units of a product mean: grams or millilitres.
enum Basis { g, ml }

enum MediaOwner { product, dish }

enum MediaKind { photo, video }

enum Sex { male, female }

enum ActivityLevel { sedentary, light, moderate, high, veryHigh }

enum WeightGoal { lose, maintain, gain }

enum GoalMode { auto, manual }
