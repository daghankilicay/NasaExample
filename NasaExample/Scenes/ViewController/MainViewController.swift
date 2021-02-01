//
//  ViewController.swift
//  NasaExample
//
//  Created by Dağhan Kılıçay on 1.02.2021.
//

import UIKit

class MainViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var segmentView: UIView!
    
    var detailView : DetailView?
    
    private var photoViewModel : PhotoViewModel!
    
    var baseResult : BaseResult?
    var pageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationLogo()
        self.photoViewModel = PhotoViewModel()
        self.callToViewModelForUIUpdate(roverType: segmentText, page: 0)
        self.collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filterData != nil && self.filterData!.count > 0 {
            return filterData!.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        if filterData != nil && filterData!.count > 0{
            cell.setUI(photo: self.filterData?[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailView = Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)?[0] as! DetailView
        detailView.frame = screen()
        detailView.setUI(photo: filterData?[indexPath.row])
        self.view.addSubview(detailView)
    }
    
    var isFiltered : Bool = false
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !isFiltered{
            if indexPath.item == (self.filterData?.count)! - 1  {
                self.loadMoreChapter()
            }
        }
    }
    
    private func loadMoreChapter() {
        self.pageIndex += 1
        self.callToViewModelForUIUpdate(roverType: segmentText, page: pageIndex)
    }
    
    
    // collectionViewLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: segmentView.frame.height + 10, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2 - 10, height: 200 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func callToViewModelForUIUpdate(roverType: String?, page: Int){
        self.showProgress()
        self.photoViewModel.getData(roverType: roverType, page: page)
        self.photoViewModel.bindCountryViewModelToController = { [self] result -> Void in
            if result.photos.count > 0{
                self.baseResult = result
                self.filterData?.append(contentsOf: result.photos)
                self.updateDataSource()
            }else{
                self.hideProgress()
            }
        }
        self.photoViewModel.bindErrorToController = { error -> Void in
            self.showAlertMessage(message: error!.localizedDescription)
            self.hideProgress()
        }
        self.hideProgress()
    }
    
    func updateDataSource(){
        self.collectionView.reloadData()
        self.hideProgress()
    }

    @IBAction func buttonFilter(_ sender: Any) {
        self.showFilterAlert()
    }
    
    private func showFilterAlert(){
        let alertController = UIAlertController(title: "Filter", message: "Choice", preferredStyle: UIAlertController.Style.actionSheet)

        let allAction = UIAlertAction(title: "All", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "all")
        }
        
        let fhazAction = UIAlertAction(title: "FHAZ - Front Hazard Avoidance Camera", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "FHAZ")
        }
        
        let rhazAction = UIAlertAction(title: "RHAZ - Rear Hazard Avoidance Camera", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "RHAZ")
        }
        
        let mastAction = UIAlertAction(title: "MAST - Mast Camera", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "MAST")
        }
        
        let chemCamAction = UIAlertAction(title: "CHEMCAM - Chemistry and Camera Complex", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "CHEMCAM")
        }
        
        let mahliAction = UIAlertAction(title: "MAHLI - Mars Hand Lens Imager", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "MAHLI")
        }
        
        let mardiAction = UIAlertAction(title: "MARDI - Mars Descent Imager", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "MARDI")
        }
        
        let navCamAction = UIAlertAction(title: "NAVCAM - Navigation Camera", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "NAVCAM")
        }
        
        let panCamAction = UIAlertAction(title: "PANCAM - Panoramic Camera", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "PANCAM")
        }
        
        let miniTesction = UIAlertAction(title: "MINITES - Miniature Thermal Emission Spectrometer (Mini-TES)", style: .default) { (action: UIAlertAction) in
            self.setFilter(filterName: "MINITES")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(allAction)
        alertController.addAction(fhazAction)
        alertController.addAction(rhazAction)
        alertController.addAction(mastAction)
        alertController.addAction(chemCamAction)
        alertController.addAction(mahliAction)
        alertController.addAction(mardiAction)
        alertController.addAction(navCamAction)
        alertController.addAction(panCamAction)
        alertController.addAction(miniTesction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    var filterData : [Photo]? = []
    private func setFilter(filterName:String?){
        if filterName == "all"{
            self.filterData = self.baseResult?.photos
            self.isFiltered = false
        }else{
            self.isFiltered = true
            self.filterData = []
            self.filterData = self.baseResult?.photos.filter {
                return $0.camera.name?.range(of: filterName!, options: .caseInsensitive) != nil
            }
        }
        self.collectionView.reloadData()
    }
    
    var segmentText : String = RoverType.curiosity.rawValue
    @IBAction func segmentControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                self.segmentText = RoverType.curiosity.rawValue
            case 1:
                self.segmentText = RoverType.opportunity.rawValue
            case 2:
                self.segmentText = RoverType.spirit.rawValue
            default:
                break
            }
        self.filterData = []
        self.pageIndex = 0
        self.updateCollectionView(roverType: segmentText, page: pageIndex)
        self.collectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        
    }
    
    private func updateCollectionView(roverType: String?, page: Int){
        self.callToViewModelForUIUpdate(roverType: segmentText, page: page)
    }
}

