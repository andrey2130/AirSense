//
//  DashboardProgressBar.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//


import SwiftUI

struct DashboardProgressBar: View {
    let progress: Double
    var cornerRadius: CGFloat = 10
    var gradient: Color = .accent
    var trackColor: Color = .track

    @ScaledMetric private var height: CGFloat = 10

    private var clampedProgress: Double {
        min(max(progress, 0), 1)
    }

    var body: some View {
        bar
            .frame(height: height)
            .animation(.easeInOut(duration: 0.3), value: clampedProgress)
    }

    private var bar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                track
                fill(in: geometry.size.width)
            }
        }
    }

    private var track: some View {
        shape
            .fill(trackColor)
    }

    private func fill(in totalWidth: CGFloat) -> some View {
        shape
            .fill(gradient)
            .frame(width: fillWidth(in: totalWidth))
    }

    private var shape: RoundedRectangle {
        RoundedRectangle(cornerRadius: cornerRadius)
    }

    private func fillWidth(in totalWidth: CGFloat) -> CGFloat {
        guard clampedProgress > 0 else { return 0 }
        return max(totalWidth * clampedProgress, height)
    }
}

