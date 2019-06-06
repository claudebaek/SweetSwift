
import UIKit
import Alamofire

class TopMediaViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBInspectable var feedURL: String!
    @IBInspectable var titleString: String?
    
    fileprivate func extractedFunc(_ url: URL) -> (DataRequest) {
        return Alamofire.request(url)
            .responseJSON { (response) in
                
                if let jsonData = response.data,
                    let feed = (try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)) as? NSDictionary,
                    
                    let title = feed.value(forKeyPath: "feed.entry.im:name.label") as? String,
                    let artist = feed.value(forKeyPath: "feed.entry.im:artist.label") as? String,
                    let imageURLs = feed.value(forKeyPath: "feed.entry.im:image") as? [NSDictionary] {
                    if let imageURL = imageURLs.last,
                        let imageURLString = imageURL.value(forKeyPath: "label") as? String {
                        self.loadImageFromURL(URL(string:imageURLString)!)
                    }
                    self.titleLabel.text = title
                    self.titleLabel.isHidden = false
                    self.artistLabel.text = artist
                    self.artistLabel.isHidden = false
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = titleString

        guard let url = URL(string: feedURL) else {
            NSLog("URL 생성 실패")
            return
        }
        
        extractedFunc(url)
        
//        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { response, data, error in
//            if let jsonData = data,
//                let feed = (try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)) as? NSDictionary,
//                let title = feed.value(forKeyPath: "feed.entry.im:name.label") as? String,
//                let artist = feed.value(forKeyPath: "feed.entry.im:artist.label") as? String,
//                let imageURLs = feed.value(forKeyPath: "feed.entry.im:image") as? [NSDictionary] {
//                    if let imageURL = imageURLs.last,
//                        let imageURLString = imageURL.value(forKeyPath: "label") as? String {
//                            self.loadImageFromURL(URL(string:imageURLString)!)
//                    }
//                self.titleLabel.text = title
//                self.titleLabel.isHidden = false
//                self.artistLabel.text = artist
//                self.artistLabel.isHidden = false
//            }
//        }
    }
    
    func loadImageFromURL(_ URL: URL) {
        let request = URLRequest(url: URL)
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { response, data, error in
            if let imageData = data {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
}
