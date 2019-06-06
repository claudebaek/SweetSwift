

import Foundation

class Diary {
    
    private var diaryMemos: [DiaryMemo]
    var count: Int {
        return diaryMemos.count
    }

    init(memos: [DiaryMemo]) {
        self.diaryMemos = memos
    }

    func addMemo(memo: DiaryMemo) {
        diaryMemos.append(memo)
    }
    
    func memo(index: Int) -> DiaryMemo? {
        if index >= 0 && index < count {
            return diaryMemos[index]
        } else {
            return nil
        }
    }
    
}
