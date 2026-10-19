//
//  FontName.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//

import SwiftUI

enum AppTextStyle: CaseIterable {
    /// iOS/Large Title — 34pt Bold. Великі заголовки екранів.
    case largeTitle
    /// iOS/Title 1 — 28pt Bold. Заголовки онбордингу, назва на Launch screen.
    case title1
    /// iOS/Title 2 — 22pt Bold. «Добре», «Bluetooth вимкнено».
    case title2
    /// iOS/Title 3 — 20pt Semibold. «Показники», мін/сер/макс.
    case title3
    /// iOS/Headline — 17pt Semibold. Кнопки, заголовки сповіщень.
    case headline
    /// iOS/Body — 17pt Regular. Основний текст, рядки списків.
    case body
    /// iOS/Callout — 16pt Regular.
    case callout
    /// iOS/Subheadline — 15pt Regular. Назви показників, описи.
    case subheadline
    /// iOS/Subheadline Emphasized — 15pt Semibold. Чипи, статус пристрою.
    case subheadlineEmphasized
    /// iOS/Footnote — 13pt Regular. Заголовки секцій, підписи.
    case footnote
    /// iOS/Caption 1 — 12pt Regular.
    case caption1
    /// iOS/Caption 1 Emphasized — 12pt Semibold. Статус у плитці («Норма»).
    case caption1Emphasized
    /// iOS/Caption 2 — 11pt Medium. Підписи таб-бару, осі графіка.
    case caption2
    /// AirSense/Display — 64pt Bold. Великі числа: індекс «42», «620».
    case display
    /// AirSense/Value — 28pt Semibold. Числа в плитках показників.
    case value

    var font: Font {
        switch self {
        case .largeTitle: .system(.largeTitle, weight: .bold)
        case .title1: .system(.title, weight: .bold)
        case .title2: .system(.title2, weight: .bold)
        case .title3: .system(.title3, weight: .semibold)
        case .headline: .system(.headline)
        case .body: .system(.body)
        case .callout: .system(.callout)
        case .subheadline: .system(.subheadline)
        case .subheadlineEmphasized: .system(.subheadline, weight: .semibold)
        case .footnote: .system(.footnote)
        case .caption1: .system(.caption)
        case .caption1Emphasized: .system(.caption, weight: .semibold)
        case .caption2: .system(.caption2, weight: .medium)
        case .display: .system(size: 64, weight: .bold).monospacedDigit()
        case .value: .system(.title, weight: .semibold).monospacedDigit()
        }
    }
}

// MARK: - View Extension

extension View {
    func textStyle(_ style: AppTextStyle) -> some View {
        font(style.font)
    }
}
