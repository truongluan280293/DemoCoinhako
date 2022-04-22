//
//  ListCoinViewController.swift
//  coinhako
//
//  Created by Macbook on 21/04/2022.
//

import UIKit

class ListCoinViewController: UIViewController {

    var vm: CoinViewModel
    
    @IBOutlet weak var tableView: UITableView!
    var refreshUI: UIRefreshControl?
    
    required init?(coder: NSCoder) {
        let network = ServiceAPI.init()
        let service = CoinServices.init(service: network)
        self.vm = CoinViewModel.init(coinService: service)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
        
    }


    private func setup() {
        self.vm.coinDidUpdate = coinDidUpdate
        self.tableView.register(.init(nibName: "CoinCell", bundle: .main), forCellReuseIdentifier: "CoinCell")
        self.tableView.register(.init(nibName: "NoDataCell", bundle: .main), forCellReuseIdentifier: "NoDataCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.init(named: "BGLine")
        self.title = "Price in USD"
        
        self.refreshUI = UIRefreshControl()
        self.refreshUI?.tintColor = .white
        self.tableView.addSubview(self.refreshUI!)
        self.refreshUI?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        self.showRefresh()
    }
    
    func showRefresh() {
        self.tableView.setContentOffset(.init(x: 0, y: -self.refreshUI!.frame.size.height), animated: true)
        self.refreshUI?.beginRefreshing()
    }
    
    //MARK: - Callback from ViewModel
    func coinDidUpdate() {
        print("update:... \(self.vm.countCoin)")
        self.refreshUI?.endRefreshing()
        self.tableView.reloadData()
    }
    
    //MARK: - User Actions
    @objc
    func pullToRefresh() {
        self.showRefresh()
        self.vm.refreshCoin()
    }
}


extension ListCoinViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.vm.countCoin == 0 {
            return 1
        }
        return self.vm.countCoin
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.vm.countCoin != 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "CoinCell") as! CoinCell
            if let obj = self.vm.getCoin(index: indexPath.row) {
                cell.setData(obj: obj)
            }
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "NoDataCell") as! NoDataCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.vm.countCoin == 0 {
            return self.tableView.frame.size.height
        } else {
            return 77
        }
    }
    
}
