//
//  CollectionViewController.swift
//  CodingChallenge
//
//  Created by Steven Harvath on 8/5/16.
//  Copyright © 2016 Steven Harvath. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let reuseIdentifier = Constants.clinicCellResuseIdentifier
    
    var currentFrameSize : CGSize!
    var clinicStorage : ClinicStorage!
    var clinics = [Clinic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.clinics
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector(Constants.reloadSelectorPostNotification), name: Constants.reloadClinicCollectionNotification , object: nil)
        
        clinicStorage = ClinicStorage(cacheName: Constants.clinicListCacheName, objectKey: Constants.clinicListCacheObjectKey)
    }
    
    override func viewWillAppear(animated: Bool) {
        clinics = clinicStorage.getClinics()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return clinicStorage.getCount()
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ClinicCell
        
        cell.clinicNameLabel.text = clinics[indexPath.section].getName()
        cell.isPreferredLabel.text = "\(Constants.isPreferred) \(clinics[indexPath.section].getIsPreferred().description)"
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Constants.clinicToDetailSegue, sender: clinics[indexPath.section])
    }
    
    // MARK: UICollectionCellSize
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if currentFrameSize == nil {
            currentFrameSize = self.view.frame.size
        }

        return CGSizeMake(currentFrameSize.width - 80, 69)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        currentFrameSize = size
        
        self.collectionView?.performBatchUpdates(nil, completion: nil)
    }
    
    func reload(notification:NSNotification){
        self.collectionView?.reloadData()
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.clinicToDetailSegue {
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.clinic = sender as? Clinic
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(Constants.reloadClinicCollectionNotification)
    }
}

class ClinicCell:UICollectionViewCell {
    @IBOutlet weak var clinicNameLabel: UILabel!
    @IBOutlet weak var isPreferredLabel: UILabel!
}
