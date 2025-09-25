//
//  UITableViewControllerDemo.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 25/08/25.
//

import UIKit

final class UITableViewControllerDemo: UITableViewController {
    // MARK: Logic Vars
    var photos: [UnsplashPhoto] = .init()
    
    // MARK: Lifecycle management
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutConfiguration()
        loadPhotos()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        present(CenteringTestController(), animated: true)
//    }
    
    // MARK: Configuration Management
    private func layoutConfiguration() {
        title = NSLocalizedString("uiTableViewController", comment: .empty)
        
        view.backgroundColor = .systemGroupedBackground
        
        UnsplashPhotoContentViewStyle.allCases.forEach { style in
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: style.reuseIdentifier())
        }
        tableView.dataSource = self
    }
    
    // MARK: Data Source Management
    func loadPhotos() {
        Task {
            do {
                let photos = try await UnsplashPhoto.get()
                let differences = photos.difference(from: self.photos)
                await MainActor.run {
                    drawPhotos(photos, using: differences)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func drawPhotos(_ newPhotos: [UnsplashPhoto], using differences: CollectionDifference<UnsplashPhoto>) {
        tableView.beginUpdates()
        photos = newPhotos
        for difference in differences {
            switch difference {
            case .insert(let index, _, _):
                tableView.insertRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            case .remove(let index, _, _):
                tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            }
        }
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configuration = photos[indexPath.row].contentConfiguration()
        let cell = tableView.dequeueReusableCell(withIdentifier: configuration.style.reuseIdentifier(), for: indexPath)
        cell.contentConfiguration = configuration
        return cell
    }
}


class CenteringTestController: UIViewController {
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: CGSize(width: 50, height: 50)))
        view.backgroundColor = .orange
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        
        containerView.clipped(to: view)
        contentView.centered(to: containerView, size: contentView.frame.size)
    }
}
