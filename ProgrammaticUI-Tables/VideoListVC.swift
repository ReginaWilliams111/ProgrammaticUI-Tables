//
//  VideoListVC.swift
//  TestProject1
//
//  Created by Regina Williams on 8/28/21.
//

import UIKit

class VideoListVC: UIViewController {
    var tableView = UITableView()
    var videos:[Video] = []
    
    struct Cells {
        static let videoCell = "videoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Programmatic UI - Tables"
        videos = fetchData()
        configureTableView()
        
    }
    

    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        // set the delegate
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension VideoListVC : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}

extension VideoListVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let videoCell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell)  as? VideoCell else {
            fatalError("Unable to dequeue videoCell")
        }
        videoCell.set(video: videos[indexPath.row])
        return videoCell
    }
    
    
}

extension VideoListVC {
    
    func fetchData() -> [Video] {
        
        var videos:[Video] = []
        
        videos.append(Video(image: Images.crayon   , title: "I love Crayons"))
        videos.append(Video(image: Images.pin      , title: "I love pins"))
        videos.append(Video(image: Images.write    , title: "Writing is fun"))
        videos.append(Video(image: Images.sticky   , title: "Get it done with sticky notes"))
        videos.append(Video(image: Images.books    , title: "I love Books"))
        videos.append(Video(image: Images.laptop   , title: "Go everywhere with laptops"))
        videos.append(Video(image: Images.takeNotes, title: "Taking notes to pass anything"))
        videos.append(Video(image: Images.paper    , title: "When is paper OK"))
        videos.append(Video(image: Images.chalk    , title: "Oh the sound of chalk on the board!"))
        videos.append(Video(image: Images.working  , title: "Working for yourself can be fulfilling"))
        
        return videos
    }
    
}
