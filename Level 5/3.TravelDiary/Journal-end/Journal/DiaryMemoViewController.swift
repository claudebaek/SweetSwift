

import UIKit

class DiaryMemoViewController: UIViewController {
    
    @IBOutlet weak var diaryMemoContents: UITextView!
    var diaryMemo: DiaryMemo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let diaryMemo = diaryMemo {
            diaryMemoContents.text = diaryMemo.contents
            navigationItem.title = "Oct 5, 2015 9:41 AM" //journalEntry.description
        }
    }
}
