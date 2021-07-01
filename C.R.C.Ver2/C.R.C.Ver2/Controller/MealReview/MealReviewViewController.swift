//
//  MealReviewViewController.swift
//  C.R.C.Ver2
//
//  Created by 조주혁 on 2021/06/13.
//

import UIKit
import Alamofire

class MealReviewViewController: UIViewController {

    @IBOutlet weak var mealReviewTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        apiCall()
    }
    
    func setting() {
        mealReviewTableView.delegate = self
        mealReviewTableView.dataSource = self
    }
    
    func apiCall() {
        let URL = "http://10.120.75.224:3000/review/check"
        let token = TokenManager.getToken()
        AF.request(URL, method: .get, headers: ["Token": token]).responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension MealReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealReviewTableViewCell", for: indexPath) as! MealReviewTableViewCell
        
        cell.updateConstraintsIfNeeded()
        
        return cell
    }
    
    
    
    
}
