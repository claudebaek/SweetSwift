

import UIKit

class NewDiaryMemoViewController: UIViewController {

    @IBOutlet weak var DiaryMemoContents: UITextView!
    var diary: Diary?
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        let memo = DiaryMemo(date: Date(), contents: DiaryMemoContents.text)
        diary?.addMemo(memo: memo)
        dismiss(animated: true, completion: nil)
    }
}
