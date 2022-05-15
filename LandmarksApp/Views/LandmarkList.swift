//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Bogdan Moroz on 15.5.2022.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favourites only")
                    }
                    ForEach(filteredLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }.navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        
    }
}
