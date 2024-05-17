//
//  SpmPlugin.swift
//  App
//
//  Created by taqtile on 17.05.24.
//

import Foundation
import Capacitor
import TextToStructure

@objc(SpmPlugin)
public class SpmPlugin: CAPPlugin {
    
    @objc func getModel(_ call: CAPPluginCall){
        // Assuming these variables are passed as parameters to the function call
        print("getModel")
        guard let grammarPath = call.getString("grammarPath"),
              let modelPath = call.getString("modelPath"),
              let systemPrompt = call.getString("systemPrompt"),
              let text = call.getString("text") else {
            call.reject("Missing required parameters")
            return
        }

        Task {
            do {
                let generator = try await TextToStructure(grammar: grammarPath, modelPath: modelPath, systemPrompt: systemPrompt)
                let result = try await generator.generate(prompt: text)
                print(result)
                call.resolve(["result": result])
            } catch {
                print("Error")
                call.reject("Error: \(error.localizedDescription)")
            }
        }
    }
}

