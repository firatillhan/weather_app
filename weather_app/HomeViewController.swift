//
//  ViewController.swift
//  weather_app
//
//  Created by Fırat İlhan on 25.05.2026.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var cities: [CityWeatherItem] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        searchBar.barTintColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        cities = TestData().testData()
        tableView.reloadData()
    }
    
    
   


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityWeatherCell
        
        let city = cities[indexPath.row]
        cell.configure(city: city.city, subtitle: city.subtitle, condition: city.condition, temp: city.temp, minTemp: city.minTemp, maxTemp: city.maxTemp)
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110  
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
           let detailVC = segue.destination as? DetailViewController,
           let indexPath = sender as? IndexPath {
            detailVC.selectedCity = cities[indexPath.row]
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Arama sonuçları ileride buraya gelecek
    }
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
