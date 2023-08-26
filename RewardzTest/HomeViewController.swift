//
//  HomeViewController.swift
//  RewardzTest
//
//  Created by madhuri alshi on 25/08/23.
//

import Foundation
import UIKit

class HomeViewController :UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
   
    var FruitDict:[[String:Any]] = [["Img":"Honey-Lime-Peach-Fruit-Salad","name":"Honey lime combo","price":"2,000"],["Img":"Frame 51","name":"Berry mango combo","price": "8,000"],["Img":"Melon-Berry-Salad","name":"Melon-Berry Salad","price":"5,000"],["Img":"Tropical-Fruit-Salad","name":"Tropical fruit salad","price":"3,000"],["Img":"quinoa-and-red-fruit-salad","name":"Quinoa fruit salad","price":"10,000"]]
    
    var HottestFruitDict:[[String:Any]] = [["Img":"quinoa-and-red-fruit-salad","name":"Quinoa fruit salad","price":"10,000","backColor":"FFFAEB"],["Img":"Tropical-Fruit-Salad","name":"Tropical fruit salad","price":"3,000","backColor":"FEF0F0"],["Img":"Melon-Berry-Salad","name":"Melon-Berry Salad","price":"5,000","backColor":"F1EFF6"],["Img":"Honey-Lime-Peach-Fruit-Salad","name":"Honey lime combo","price":"2,000","backColor":"#e0fffd"],["Img":"Frame 51","name":"Berry mango combo","price": "8,000","backColor":"#ffe0e0"]]
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var recommendedLabel: UILabel!
    var filterArray = ["Hottest","Popular","New combo","Top"]
    var selectedCategoryIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        searchTextField.tintColor = UIColor.lightGray
        searchTextField.layer.cornerRadius = 16
        searchTextField.setIcon(UIImage(named:"bi_search")!)
        CollectionViewUI()
        CategoryCollectionViewUI()
        FilterCollectionViewUI()
        
    }
    var CollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    func CollectionViewUI() {
        let layout1 = UICollectionViewFlowLayout()
        layout1.minimumInteritemSpacing = 15
        layout1.minimumLineSpacing = 15
        layout1.itemSize = CGSize(width: 152 , height: 183)
        layout1.scrollDirection = .horizontal
        CollectionView.translatesAutoresizingMaskIntoConstraints = false
        CollectionView.dataSource = self
        CollectionView.delegate = self
        CollectionView.setCollectionViewLayout(layout1, animated: true)
        CollectionView.clipsToBounds = true
        CollectionView.backgroundColor = UIColor.clear
        CollectionView.showsVerticalScrollIndicator = false
        CollectionView.showsHorizontalScrollIndicator = false
        CollectionView.register(UINib(nibName: "collectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        view.addSubview(CollectionView)
        NSLayoutConstraint(item: CollectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: CollectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 22).isActive = true
        NSLayoutConstraint(item: CollectionView, attribute: .top, relatedBy: .equal, toItem: recommendedLabel, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: CollectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 185).isActive = true
    }
    
    
    var CategoryCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    func CategoryCollectionViewUI() {
        let layout1 = UICollectionViewFlowLayout()
        layout1.minimumInteritemSpacing = 10
        layout1.minimumLineSpacing = 10
        layout1.itemSize = CGSize(width: 85 , height: 38)
        layout1.scrollDirection = .horizontal
        CategoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        CategoryCollectionView.dataSource = self
        CategoryCollectionView.delegate = self
        CategoryCollectionView.setCollectionViewLayout(layout1, animated: true)
        CategoryCollectionView.clipsToBounds = true
        CategoryCollectionView.backgroundColor = UIColor.clear
        CategoryCollectionView.showsVerticalScrollIndicator = false
        CategoryCollectionView.showsHorizontalScrollIndicator = false
        CategoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        view.addSubview(CategoryCollectionView)
        NSLayoutConstraint(item: CategoryCollectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -24).isActive = true
        NSLayoutConstraint(item: CategoryCollectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 24).isActive = true
        NSLayoutConstraint(item: CategoryCollectionView, attribute: .top, relatedBy: .equal, toItem: CollectionView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: CategoryCollectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 35).isActive = true
    }
    
    var FilterCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    func FilterCollectionViewUI() {
        let layout1 = UICollectionViewFlowLayout()
        layout1.minimumInteritemSpacing = 15
        layout1.minimumLineSpacing = 15
        layout1.itemSize = CGSize(width: 152 , height: 183)
        layout1.scrollDirection = .horizontal
        
        FilterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        FilterCollectionView.dataSource = self
        FilterCollectionView.delegate = self
        FilterCollectionView.setCollectionViewLayout(layout1, animated: true)
        FilterCollectionView.clipsToBounds = true
        FilterCollectionView.backgroundColor = UIColor.clear
        FilterCollectionView.showsVerticalScrollIndicator = false
        FilterCollectionView.showsHorizontalScrollIndicator = false
        FilterCollectionView.register(UINib(nibName: "collectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        view.addSubview(FilterCollectionView)
        NSLayoutConstraint(item: FilterCollectionView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: FilterCollectionView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 21).isActive = true
        NSLayoutConstraint(item: FilterCollectionView, attribute: .top, relatedBy: .equal, toItem: CategoryCollectionView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: FilterCollectionView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 185).isActive = true
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
            cell.priceLabel.text = "₦" + "\(String(describing: FruitDict[indexPath.row]["price"]!))"
            cell.fruitName.text = FruitDict[indexPath.row]["name"] as? String
            cell.imageView.image = UIImage(named: FruitDict[indexPath.row]["Img"] as! String)
            cell.imageView.layer.cornerRadius = 40
            cell.layer.cornerRadius = 20
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 0.1
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 10)
            cell.layer.shadowRadius = 6
            cell.layer.shadowOpacity = 7
            cell.layer.masksToBounds = true
            return cell
        }else if collectionView == CategoryCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            cell.filterLabel.text = filterArray[indexPath.row]
            if selectedCategoryIndex == indexPath.row {
                cell.filterLabel.font = UIFont.init(name: "Brandon_med", size: 24)
                cell.filterLabel.textColor = UIColor(red: 39/255, green: 33/255, blue: 77/255, alpha: 1.0)
                cell.lineView.isHidden = false
            }else{
                cell.lineView.isHidden = true
                cell.filterLabel.font = UIFont.init(name: "Brandon_med", size: 16)
                cell.filterLabel.textColor = UIColor(red: 147/255, green: 141/255, blue: 181/255, alpha: 1.0)
            }
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! collectionViewCell
            cell.imageView.image = UIImage(named: FruitDict[indexPath.row]["Img"] as! String)
            cell.imageView.layer.cornerRadius = 40
            cell.priceLabel.text = "₦" + "\(String(describing: HottestFruitDict[indexPath.row]["price"]!))"
            cell.fruitName.text = HottestFruitDict[indexPath.row]["name"] as? String
            cell.backgroundColor = UIColor().colorFromHexString(HottestFruitDict[indexPath.row]["backColor"] as! String)
            cell.layer.cornerRadius = 15

            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == CollectionView{
            return FruitDict.count
        }else if collectionView == CategoryCollectionView{
            return filterArray.count
        }else{
            return HottestFruitDict.count
        }
    }
    
}

extension UITextField {
func setIcon(_ image: UIImage) {
   let iconView = UIImageView(frame:
                                CGRect(x: 15, y: 5, width: 15.76, height: 16))
   iconView.image = image
   let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 30, height: 30))
   iconContainerView.addSubview(iconView)
   leftView = iconContainerView
   leftViewMode = .always
}
}
