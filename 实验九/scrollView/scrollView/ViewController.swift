//
//  ViewController.swift
//  scrollView
//
//  Created by 7 on 2018/12/17.
//  Copyright © 2018 7. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    var scroll1: UIScrollView!
    var page: UIPageControl!
    var scroll2: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        let width = self.view.bounds.width - 20
        let height = width * 0.56
        
        scroll1 = UIScrollView(frame: CGRect(x: 10, y: 100, width: width, height: height))
        scroll1.isPagingEnabled = true
        scroll1.showsHorizontalScrollIndicator = false
        scroll1.contentSize = CGSize(width: width*5, height: height)
        scroll1.delegate = self
        self.view.addSubview(scroll1)
        
        page = UIPageControl(frame: CGRect(x: 10, y: 100+height, width: width, height: 30))
        page.numberOfPages = 5
        page.currentPage = 0
        page.pageIndicatorTintColor = UIColor.brown
        page.currentPageIndicatorTintColor = UIColor.red
        page.addTarget(self, action: #selector(pageChanged(page:)), for: .touchUpInside)
        self.view.addSubview(page)
        
        for i in 1...5 {
            let image = UIImage(named: "\(i)")
            let imageView = UIImageView(frame: CGRect(x: width*CGFloat(i-1), y: 0, width: width, height: height))
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            scroll1.addSubview(imageView)
        }
        
        
        scroll2 = UIScrollView(frame: CGRect(x: 10, y: 200+height, width: width, height: height))
        scroll2.backgroundColor = UIColor.yellow
        scroll2.contentSize = CGSize(width: width, height: height)
        scroll2.maximumZoomScale = 10
        scroll2.minimumZoomScale = 0.1
        scroll2.delegate = self
        self.view.addSubview(scroll2)
        
        let image = UIImage(named: "6")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        scroll2.addSubview(imageView)
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / (self.view.bounds.width - 20))
        page.currentPage = currentPage
    }
    
    @objc func pageChanged(page: UIPageControl) {
        let rect = CGRect(x: scroll1.bounds.width*CGFloat(page.currentPage), y: 0, width: scroll1.bounds.width, height: scroll1.bounds.height)
        scroll1.scrollRectToVisible(rect, animated: true)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scroll2.subviews.first
    }


}

