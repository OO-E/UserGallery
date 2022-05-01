//
//  PhotosCollectionViewModel.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.
//

import UIKit


class PhotosCollectionViewModel {
    
    weak var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section<PhotosObject>, PhotosObject>?
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView.collectionViewLayout = self.createLayout()
        configureDataSource()
        configureHeader()
    }
    
    
    //MARK: - Configure
    func configureDataSource() {
    
    dataSource = UICollectionViewDiffableDataSource<Section<PhotosObject>, PhotosObject>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item  in
        let cell = collectionView.dequeueCell(withClassAndIdentifier: PhotosCell.self, for: indexPath)
        cell.config(item: item)
        return cell
    })
}
    
    func configureHeader() {

        dataSource?.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in

            let header = collectionView.dequeueHeader(withClassAndIdentifier: PhotosHeaderView.self,
                                                      for: indexPath)
            let item = self.dataSource?.snapshot().sectionIdentifiers[indexPath.section]
            header.setTitle(title: (item?.title)!)
            return header
        }
    }
    
    // MARK: - CreateSnapshot
    func createSnapshot(sectionsList: [Section<PhotosObject>]) {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section<PhotosObject>, PhotosObject>()
        sectionsList.forEach { ItemPositioning in
            snapshot.appendSections([ItemPositioning])
            snapshot.appendItems(ItemPositioning.items)
        }
        self.dataSource?.apply(snapshot,animatingDifferences: true)
    }
    
    //MARK: - Layout
    func createLayout() -> UICollectionViewCompositionalLayout {
            
            let inset: CGFloat = 2.5
           
           // Items
           let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                      heightDimension: .fractionalHeight(1))
        
           let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
           largeItem.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                             leading: inset,
                                                             bottom: inset,
                                                             trailing: inset)
           
           let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.5))
        
           let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        
           smallItem.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                             leading: inset,
                                                             bottom: inset,
                                                             trailing: inset)
           
           // Nested Group
           let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                                        heightDimension: .fractionalHeight(1))
        
           let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize,
                                                              subitems: [smallItem])
           
           // Outer Group
           let outerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalWidth(0.5))
        
           let outerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: outerGroupSize,
                                                               subitems: [largeItem, nestedGroup, nestedGroup])
           
           // Section
           let section = NSCollectionLayoutSection(group: outerGroup)
        
           section.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                           leading: inset,
                                                           bottom: inset,
                                                           trailing: inset)
        
            section.orthogonalScrollingBehavior = .groupPaging

           // Supplementary Item
           let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(100))
        
           let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
           section.boundarySupplementaryItems = [headerItem]
        
           return UICollectionViewCompositionalLayout(section: section)
    }
    
}
