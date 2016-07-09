//
//  ViewController.swift
//  HelpPagesScrollDemo
//
//  Created by vimipatel on 09/07/16.
//  Copyright © 2016 vimipatel. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet var scrHelp: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var page = 0
    
    let arrTitle : [String] = ["Title1", "Title2", "Title3", "Title4", "Title5"]
    let arrImages : [String] = ["help_1", "image2.png", "image3.png", "image4.png", "image5.png"];
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //self.edgesForExtendedLayout = UIRectEdge.None
        self.title = "Help"
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createHelpView()
        
        pageControl.backgroundColor = UIColor.clearColor()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor(red: 251/255, green: 108/255, blue: 108/255, alpha: 1.0)
        pageControl.tintAdjustmentMode = UIViewTintAdjustmentMode.Dimmed
        pageControl.numberOfPages = arrTitle.count
        pageControl.currentPage = 0
        
        scrHelp.showsVerticalScrollIndicator = false
        scrHelp.showsHorizontalScrollIndicator = false
        scrHelp.pagingEnabled = true
        
    }
    
    func createHelpView() {
        
        var x = 50
        for i in 0 ..< arrTitle.count  {
            
            let lblTitle = UILabel(frame: CGRectMake(CGFloat(x), 15, CGFloat(scrHelp.frame.width-100), 25))
            lblTitle.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin
            lblTitle.backgroundColor = UIColor.clearColor()
            lblTitle.font = UIFont.systemFontOfSize(17)
            lblTitle.textAlignment = NSTextAlignment.Center
            lblTitle.textColor = UIColor.blackColor()
            lblTitle.text = arrTitle[i]
            scrHelp.addSubview(lblTitle)
            
            let imgView = UIImageView(frame: CGRectMake(CGFloat(x), 50, CGFloat(scrHelp.frame.width-100), CGFloat(scrHelp.frame.height-150)))
            imgView.autoresizingMask = UIViewAutoresizing.FlexibleBottomMargin
            imgView.backgroundColor = UIColor.redColor() //UIColor.clearColor()
            imgView.image = UIImage(named: arrImages[i])
            imgView.contentMode = UIViewContentMode.ScaleAspectFit
            scrHelp.addSubview(imgView)
            
            x = x + Int(scrHelp.frame.width)
        }
        scrHelp.contentSize = CGSizeMake(CGFloat(arrTitle.count)*self.view.frame.width, 0)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        let pageWidth = CGFloat(scrHelp.frame.width)
        let fractionalPage = scrHelp.contentOffset.x / pageWidth
        page = lround(CDouble(fractionalPage))
        pageControl.currentPage = page
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
