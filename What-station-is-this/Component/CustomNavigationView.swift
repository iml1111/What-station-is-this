//
//  SearchNavigationView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/15.
//// https://kavsoft.dev/SwiftUI_2.0/Navigation_SearchBar/

import SwiftUI

struct CustomNavigationView: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }
    
    var view: AnyView
    
    var largeTitle: Bool
    var title: String
    var placeHolder: String
    
    var onSearch: (String)->()
    var onCancel: ()->()
    
    init(
        view: AnyView,
        placeHolder: String? = "Search",
        largeTitle: Bool? = true,
        title: String,
        onSearch: @escaping (String)->(),
        onCancel: @escaping ()->()
    ) {
        self.title = title
        self.largeTitle = largeTitle!
        self.placeHolder = placeHolder!
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let childView = UIHostingController(rootView: view)
        let controller = UINavigationController(rootViewController: childView)
        
        // Nav Bar Data
        controller.navigationBar.topItem?.title = title
        controller.navigationBar.prefersLargeTitles = largeTitle
        
        
        // Search bar
        let searchController = UISearchController()
        searchController.searchBar.placeholder = placeHolder
        
        searchController.searchBar.delegate = context.coordinator
        
        searchController.obscuresBackgroundDuringPresentation = false
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = true
        controller.navigationBar.topItem?.searchController = searchController
        
        return controller
    }
    
    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context) {
        uiViewController.navigationBar.topItem?.title = title
        uiViewController.navigationBar.topItem?.searchController?.searchBar.placeholder = placeHolder
        uiViewController.navigationBar.prefersLargeTitles = largeTitle
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: CustomNavigationView
        
        init(parent: CustomNavigationView) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.onSearch(searchText)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.parent.onCancel()
        }
    }
}
