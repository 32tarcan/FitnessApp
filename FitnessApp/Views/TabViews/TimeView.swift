//
//  TimerView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI
import AVFoundation

struct TimeView: View {
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    @State private var isPaused = true
    @State private var selectedTime = Date()
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .stroke(Color(hex: "33ACD1"), lineWidth: 6)
                    .frame(width: 200, height: 200)
                Circle()
                    .stroke(Color(hex: "82E1FF"), lineWidth: 6)
                    .frame(width: 220, height: 220)
                VStack {
                    Text("Rest")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("\(timeString(time: timeRemaining))")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                }
            }
            DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .onChange(of: selectedTime) { newValue in
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.hour, .minute], from: newValue)
                    if let hour = components.hour, let minute = components.minute {
                        timeRemaining = (hour * 60 + minute) * 60
                    }
                }
                .background(Color.black)
                .cornerRadius(10)
                .padding()
                .offset(y: -30)
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        if isPaused {
                            startTimer()
                        } else {
                            stopTimer()
                        }
                        isPaused.toggle()
                    }) {
                        Text(isPaused ? "GO" : "PAUSE")
                            .font(.title2)
                            .frame(width: 178, height: 48)
                            .foregroundColor(.white)
                            .background(Color(hex: "27A4CB"))
                            .cornerRadius(6)
                    }
                    .padding()
                    Button(action: {
                        stopTimer()
                        timeRemaining = 60 // Reset the timer
                        isPaused = true
                    }) {
                        Text("SKIP")
                            .font(.title2)
                            .frame(width: 178, height: 48)
                            .foregroundColor(.white)
                            .background(Color(hex: "27A4CB"))
                            .cornerRadius(6)
                    }
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
            Image(systemName: "clock")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
            Spacer()
        }
        .background(Color(hex: "1E8FB2").opacity(0.6).edgesIgnoringSafeArea(.all))
        .onAppear {
         //   prepareAlarm()
        }
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    stopTimer()
                    playAlarm()
                }
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
//    func prepareAlarm() {
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//            
//            if let soundURL = Bundle.main.url(forResource: "alarm", withExtension: "mp3") {
//                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
//                audioPlayer?.prepareToPlay()
//            }
//        } catch {
//            print("Error loading alarm sound: \(error.localizedDescription)")
//        }
//    }
    
    func playAlarm() {
        audioPlayer?.play()
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    TimeView()
}
