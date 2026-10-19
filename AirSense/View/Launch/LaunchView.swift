//
//  LaunchView.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//

import SwiftUI

struct LaunchView: View {
    @Environment(NavigationManager.self) private var navigation
    @State private var viewModel = LaunchViewModel()

    var body: some View {
        ZStack {
            circlesSection
            brandSection
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
        .overlay(alignment: .bottom) {
            loadingSection
                .padding(.bottom, 24)
        }
        .task {
            do {
                try await viewModel.load()
                navigation.finishLaunch()
            } catch {
                //
            }
        }
    }

    private var brandSection: some View {
        VStack(spacing: 0) {
            launchIcon
                .padding(.bottom, 22)
            airSenseText
                .padding(.bottom, 8)
            cleanAir
        }
    }

    private var loadingSection: some View {
        VStack(spacing: 14) {
            progressBar
            versionText
        }
    }

    private var launchIcon: some View {
        Image(.launchScreenSelection)
            .resizable()
            .frame(width: 56, height: 56)
            .padding(24)
            .background {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.accent)
            }
    }

    private var airSenseText: some View {
        Text("AirSense")
            .textStyle(.largeTitle)
            .foregroundStyle(.textWhite)
    }

    private var cleanAir: some View {
        Text("Чисте повітря під контролем")
            .textStyle(.subheadline)
            .foregroundStyle(.textGrey)
    }

    private var progressBar: some View {
        DashboardProgressBar(progress: viewModel.progress, gradient: .accent)
            .frame(width: 120)
            .accessibilityLabel("Завантаження")
            .accessibilityValue("\(Int(viewModel.progress * 100)) відсотків")
    }

    private var versionText: some View {
        Text("v\(viewModel.appVersion)")
            .textStyle(.caption2)
            .monospaced()
            .foregroundStyle(.textGrey)
    }

    private var circlesSection: some View {
        ZStack {
            ForEach(rings, id: \.ratio) { ring in
                Circle()
                    .stroke(ring.color, lineWidth: 1)
                    .containerRelativeFrame(.horizontal) { width, _ in
                        width * ring.ratio
                    }
            }
        }
        .offset(y: -40)
        .allowsHitTesting(false)
        .accessibilityHidden(true)
    }

    private var rings: [(ratio: CGFloat, color: Color)] {
        [
            (ratio: 1.3, color: .seconCircle),
            (ratio: 0.9, color: .track),
        ]
    }
}

#Preview {
    LaunchView()
}
