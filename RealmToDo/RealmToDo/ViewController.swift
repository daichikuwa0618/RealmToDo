//
//  ViewController.swift
//  RealmToDo
//
//  Created by Daichi Hayashi on 2020/02/07.
//  Copyright © 2020 Daichi Hayashi. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: @IBOutlet
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputTableView: UITableView!

    // TodoModel 型変数，Realm から受け取った値を入れる変数
    var itemList: Results<TodoModel>!

    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)

        // Realm データベースに格納されている値を全て取得する
        self.itemList = realm.objects(TodoModel.self)
    }

    @IBAction func tapButton(_ sender: Any) {

        let todoModel: TodoModel = TodoModel()

        todoModel.items = self.inputTextField.text

        // get Realm data base
        let realm = try! Realm()

        // add records to data base
        try! realm.write {
            realm.add(todoModel)
        }

        // reload table view
        self.outputTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)

        let item: TodoModel = self.itemList[(indexPath as NSIndexPath).row]

        cell.textLabel?.text = item.items

        return cell
    }

}
