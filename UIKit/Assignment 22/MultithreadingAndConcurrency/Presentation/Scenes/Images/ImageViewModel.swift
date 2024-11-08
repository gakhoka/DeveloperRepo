//
//  ImageViewModel.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import Foundation
import UIKit

final class ImageViewModel {
    private let networkManager: NetworkManaging
    private let imageProcessor: ImageProcessing
    
    var onImagesUpdated: (() -> Void)?
    
    var images: [UIImage] = [] {
        didSet {
            onImagesUpdated?()
        }
    }
    
    
    private var imageUrls: [URL] = []
    
    init(
        networkManager: NetworkManaging = NetworkManager(),
        imageProcessor: ImageProcessing = ImageProcessor()
    ) {
        self.networkManager = networkManager
        self.imageProcessor = imageProcessor
    }
    
    func fetchImagesWithGCD() {
        var temporaryImages = [UIImage]()
        let disptachGroup = DispatchGroup()
        for url in imageUrls {
            disptachGroup.enter()
            networkManager.downloadImage(from: url ) { [weak self] image in
                guard let image = image else { return }
                self?.imageProcessor.applyFilter(to: image, completion: {  processedImage in
                    temporaryImages.append(processedImage)
                    disptachGroup.leave()
                    
                })
            }
        }
        disptachGroup.notify(queue: .main) { [weak self] in
            self?.images.append(contentsOf: temporaryImages)
            print("ui updated")
        }
    }
    
    func fetchImagesWithOperationQueue() {
        let queue = OperationQueue()
        var temporaryImages = [UIImage]()
        
        let updateUI = BlockOperation { [weak self] in
            self?.images.append(contentsOf: temporaryImages)
        }
        
        for url in imageUrls {
            let operation = BlockOperation { [weak self] in
                let semaphore = DispatchSemaphore(value: 0)
                self?.fetchAndProcessImage(from: url, completion: {  image in
                    guard let image = image else { return }
                    temporaryImages.append(image)
                    semaphore.signal()
                })
                semaphore.wait()
            }
            updateUI.addDependency(operation)
            queue.addOperation(operation)
        }
        queue.addOperation(updateUI)
       
    }

    var temporaryImages = [UIImage]()
    
    func fetchImagesWithAsyncAwait()  {
        Task {
            for url in imageUrls {
                if let processedImage = await fetchAndProcessImageAsync(from: url) {
                    temporaryImages.append(processedImage)
                }
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.images.append(contentsOf: self?.temporaryImages ?? [])
             //   self?.images = self?.temporaryImages ?? []
            }
        }
        
    }
    
    func updateNumberOfImages(to count: Int) {
        generateImageUrls(numberOfImages: count)
    }
    
    private func generateImageUrls(numberOfImages: Int) {
        let maxImageNumber = 700
        var urls: [URL] = []
        
        for _ in 1...numberOfImages {
            let randomImageNumber = Int.random(in: 1...maxImageNumber)
            if let url = URL(string: "https://yavuzceliker.github.io/sample-images/image-\(randomImageNumber).jpg") {
                urls.append(url)
            }
        }
        
        self.imageUrls = urls
    }
    
    private func fetchAndProcessImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url else { return }
        networkManager.downloadImage(from: url) { [weak self] image in
            guard let self = self, let image = image else {
                completion(nil)
                return
            }
            self.imageProcessor.applyFilter(to: image) { processedImage in
                completion(processedImage)
            }
        }
    }
    
    private func fetchAndProcessImageAsync(from url: URL?) async -> UIImage? {
        await withCheckedContinuation { continuation in
            self.fetchAndProcessImage(from: url) { image in
                continuation.resume(returning: image)
            }
        }
    }
}
