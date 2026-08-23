import SignificantHobbiesCore
import XCTest

@testable import Journal_by_Significant_Hobbies

final class JournalOnboardingTests: XCTestCase {
    func testNewEmptyJournalPresentsOnboarding() {
        XCTAssertTrue(JournalOnboardingPolicy.shouldPresent(completed: false, entries: []))
    }

    func testExistingWritingReceivesIllustratedOnboardingOnce() {
        let entry = DailyEntry(date: .now, journal: "Already here")
        XCTAssertTrue(JournalOnboardingPolicy.shouldPresent(completed: false, entries: [entry]))
        XCTAssertFalse(JournalOnboardingPolicy.shouldPresent(completed: true, entries: [entry]))
    }

    func testCompletionAndForcedEvidenceAreExplicit() {
        XCTAssertFalse(JournalOnboardingPolicy.shouldPresent(completed: true, entries: []))
        XCTAssertTrue(JournalOnboardingPolicy.shouldPresent(completed: false, entries: [], forced: true))
        XCTAssertTrue(JournalOnboardingPolicy.shouldPresent(completed: true, entries: [], forced: true))
    }
}
