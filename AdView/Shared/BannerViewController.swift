//
//  BannerViewController.swift
//  AdView
//
//  Created by David Lee on 14/01/21.
//

import SwiftUI
import GoogleMobileAds
import UIKit

final private class BannerViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let view = GDABannerView(adsize: kGADAdSizeBanner)
    }
}
