//
//  TimerView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    @State private var isPaused = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .stroke(Color.purple.opacity(0.4), lineWidth: 10)
                    .frame(width: 200, height: 200)
                VStack {
                    Text("Rest")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("\(timeString(time: timeRemaining))")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .onAppear {
                            startTimer()
                        }
                }
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    // Done button action
                    if isPaused {
                        startTimer()
                    } else {
                        stopTimer()
                    }
                    isPaused.toggle()
                }) {
                    Text(isPaused ? "DONE" : "PAUSE")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "33ACD1"))
                        .cornerRadius(10)
                }
                Spacer()
                Button(action: {
                    // Skip button action
                    stopTimer()
                    timeRemaining = 60 // Reset the timer
                    isPaused = false
                    startTimer()
                }) {
                    Text("SKIP")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "33ACD1"))
                        .cornerRadius(10)
                }
                Spacer()
            }
            Spacer()
            Text("Next 2/5")
                .font(.title)
                .foregroundColor(.white)
            Text("Cable Rope Upright")
                .font(.title)
                .foregroundColor(.white)
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
            Spacer()
        }
        .background(Color(hex: "27A4CB").opacity(0.6).edgesIgnoringSafeArea(.all))
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    stopTimer()
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView()
}
