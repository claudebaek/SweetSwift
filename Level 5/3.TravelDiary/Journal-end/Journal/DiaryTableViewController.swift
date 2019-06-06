

import UIKit

class DiaryTableViewController: UITableViewController {

    let cellReuseIdentifier = "diaryMemoCell"
    let diaryMemoSegueIdentifier = "diaryMemo"
    let newDiaryMemoSegueIdentifier = "newDiaryMemo"
    var diary = Diary(memos: (0..<4).map { DiaryMemo(date: Date(), contents: "메모 \($0)") })
    

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(#function)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath as IndexPath)
        if let label = cell.textLabel,
            let memo = diary.memo(index: indexPath.row) {
            label.text = "\(memo)"
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == diaryMemoSegueIdentifier {
            if let journalEntryViewController = segue.destination as? DiaryMemoViewController,
                let cell = sender as? UITableViewCell,
                let indexPath = self.tableView.indexPath(for: cell),
                let entry = diary.memo(index: indexPath.row) {
                journalEntryViewController.diaryMemo = entry
            }
        } else if segue.identifier == newDiaryMemoSegueIdentifier {
            if let newDiaryMemoVC = segue.destination as? NewDiaryMemoViewController {
                newDiaryMemoVC.diary = diary
            }
        }
    }
}
