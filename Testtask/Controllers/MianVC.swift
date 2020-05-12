//
//  MianVC.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//

import UIKit

class MianVC: UIViewController,UIPageViewControllerDelegate, UIPageViewControllerDataSource {
  @IBOutlet weak var postCollectionView :UICollectionView!
    @IBOutlet weak var containerView : UIView?
    private var pageViewController: UIPageViewController?
     var currentDashoboardPageIndex = 0
    var tappedCategory = Int ()
    let array = ["Overview","Additional Info","Contact" ,"Comment"]
    private(set) lazy var childsViewControllers: [UIViewController] =
    {
        return [self.newChildsViewController(Id: "ViewControllerID"),
               
                self.newChildsViewController(Id: "ViewControllerID"),
                self.newChildsViewController(Id: "ViewControllerID"),
                self.newChildsViewController(Id: "ViewControllerID")]
    }()
    private func newChildsViewController(Id: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String.init(format: "%@", Id))
    }
    private func createPageViewController()
       {
           let pageController = self.storyboard!.instantiateViewController(withIdentifier: "PageVCID") as! UIPageViewController
           pageController.dataSource = self
           
           if childsViewControllers.count > 0
           {
               let firstController = childsViewControllers.first
               let startingViewControllers = [firstController]
               pageController.setViewControllers(startingViewControllers as? [UIViewController], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
           }
           pageController.view.frame = CGRect.init(x: 0, y: 0, width: (self.containerView?.frame.size.width)!, height: (self.containerView?.frame.size.height)!)
           pageViewController = pageController
           
           addChild(pageViewController!)
           self.containerView?.addSubview(pageViewController!.view)
           pageViewController!.didMove(toParent: self)
           
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createPageViewController()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        self.postCollectionView.reloadData()
        
        
      }

    /*------ Page View Controller DataSource ------*/
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
       {
           return nil
           
           //        guard let viewControllerIndex = childsViewControllers.firstIndex(of: viewController) else {
           //            return nil
           //        }
           //
           //        let previousIndex = viewControllerIndex - 1
           //        currentDashoboardPageIndex = viewControllerIndex
           //        //updateBottomView(tag: viewControllerIndex)
           //        guard previousIndex >= 0 else {
           //            return nil
           //        }
           //
           //        guard childsViewControllers.count > previousIndex else {
           //            return nil
           //        }
           //
           //        return childsViewControllers[previousIndex]
       }
       
       func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
       {
           return nil
           //        guard let viewControllerIndex = childsViewControllers.firstIndex(of: viewController) else {
           //            return nil
           //        }
           //        currentDashoboardPageIndex = viewControllerIndex
           //
           //        //updateBottomView(tag: viewControllerIndex)
           //        let nextIndex = viewControllerIndex + 1
           //        let orderedViewControllersCount = childsViewControllers.count
           //
           //        guard orderedViewControllersCount != nextIndex else {
           //            return nil
           //        }
           //
           //        guard orderedViewControllersCount > nextIndex else {
           //            return nil
           //        }
           //
           //        return childsViewControllers[nextIndex]
       }
       
       func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
       {
           return childsViewControllers.count
       }
       
       func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
       {
           guard let firstViewController = self.pageViewController?.viewControllers?.first,
               let firstViewControllerIndex = childsViewControllers.firstIndex(of: firstViewController) else {
                   return 0
           }
           currentDashoboardPageIndex = firstViewControllerIndex
         
           
           
           return firstViewControllerIndex
       }
       

       
    

}
extension MianVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
         return array.count
     }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
         
       cell.categoryLbl.text = self.array[indexPath.row]
        
   
      cell.categoryLbl.textColor = self.tappedCategory == indexPath.row ? UIColor.blue : UIColor.darkGray
          cell.categoryView.backgroundColor = self.tappedCategory == indexPath.row ? UIColor.blue : UIColor.white
 
         
         
         return cell
     }
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         tappedCategory = indexPath.row
         self.postCollectionView.reloadData()
        
        
 
     
         if let controller : UIViewController = self.childsViewControllers[tappedCategory]
         {
             if self.presentationIndexForPageViewController(pageViewController: self.pageViewController!) < tappedCategory
             {
                 self.pageViewController?.setViewControllers([controller], direction: .forward, animated: false, completion: nil)
             }
             else
             {
                 self.pageViewController?.setViewControllers([controller], direction: .reverse, animated: false, completion: nil)
             }
         }
         currentDashoboardPageIndex = tappedCategory
        //updateBottomView(tag:tappedCategory)

     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let yourWidth = collectionView.bounds.width/4.0
         let yourHeight = collectionView.bounds.height
         
         return CGSize(width: yourWidth, height: yourHeight)
     }
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0
         
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 0
         
 }
}
