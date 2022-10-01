//
//  ListTableViewController.swift
//  movieList_customTable
//
//  Created by Ya Yu Yeh on 2022/9/29.
//


//import SafariServices
import UIKit

class ListTableViewController: UITableViewController {
    let movies = [
        Series(series: "Horror", film: [
            Film(enName: "Ju-On: The Grudge", chName: "咒怨", pic: "JuOn", releaseDate: "(2003)", trailer: "4Jkh2LpL58I"),
            Film(enName: "Shutter", chName: "鬼影", pic: "Shutter", releaseDate: "(2004)", trailer: "0b9rhKktSts"),
            Film(enName: "Orphan", chName: "孤兒怨", pic: "Orphan", releaseDate: "(2009)", trailer: "0InU79e4gDs"),
            Film(enName: "The Autopsy of Jane Doe", chName: "驗屍官", pic: "Autopsy", releaseDate: "(2016)", trailer: "IQLfX3l_bTs"),
            Film(enName: "It", chName: "牠", pic: "It", releaseDate: "(2017)", trailer: "V3W37algi-s"),
            Film(enName: "A Quiet Place", chName: "噤界", pic: "Quiet", releaseDate: "(2018)", trailer: "mq22dsWLkNE"),
            Film(enName: "Incantation", chName: "咒", pic: "Incantation", releaseDate: "(2022)", trailer: "UEdXuvh4HTE")]),
        Series(series: "Suspense", film: [
            Film(enName: "Before I Go to Sleep", chName: "別相信任何人", pic: "Before", releaseDate: "(2014)", trailer:"T8TymAI228Y"),
            Film(enName: "Gone Girl", chName: "控制", pic: "GoneGirl", releaseDate: "(2014)", trailer: "LFaJHEQbxpQ"),
            Film(enName: "Split", chName: "分裂", pic: "Split", releaseDate: "(2016)", trailer: "l3gfyfPfKss"),
            Film(enName: "Get Out", chName: "逃出絕命鎮", pic: "GetOut", releaseDate: "(2017)", trailer: "4-S9Vo9UF94&t=2s"),
            Film(enName: "1922", chName: "一九二二", pic: "1922", releaseDate: "(2017)", trailer: "AnaS7FpxJRQ"),
            Film(enName: "Detention", chName: "返校", pic: "Detention", releaseDate: "(2019)", trailer: "Cq0K2ipTaPM")])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        //固定row高度
        tableView.rowHeight = 160
        //取消分隔線
        tableView.separatorStyle = .none
    }
    
    // MARK: - Table view data source
    //表格有幾段
    override func numberOfSections(in tableView: UITableView) -> Int {
        return movies.count
    }
    //每段表格有幾列
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let movie = movies[section].film
        return movie.count
    }
    //準備每一個位置的儲存格
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MovieTableViewCell.reuseIdentifier)", for: indexPath) as? MovieTableViewCell
        else{
            //若cell沒有呼叫成功，fatalError會讓app死掉
            fatalError("dequeueReusableCell failed")
        }
        let movie = movies[indexPath.section].film[indexPath.row]
        cell.pic.image = UIImage(named: movie.pic)
        cell.chNameLbl.text = movie.chName
        cell.enNameLbl.text = movie.enName
        cell.releaseDateLbl.text = movie.releaseDate
        //設定cell樣式
        //字型、大小
        cell.chNameLbl.font = UIFont(name: "Huiwen-mincho", size: 21)
        cell.chNameLbl.textColor = .white
        cell.enNameLbl.font = UIFont(name: "Huiwen-mincho", size: 18)
        cell.enNameLbl.textColor = .white
        cell.releaseDateLbl.font = UIFont(name: "Huiwen-mincho", size: 18)
        cell.releaseDateLbl.textColor = .white
        //cell設定accessory樣式
        cell.accessoryType = .disclosureIndicator
        //表格背景顏色
        cell.backgroundColor = .black
        //取消點選效果
        cell.selectionStyle = .none
        
        return cell
    }
    
    //header標題->section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let series = movies[section].series
        return series
    }
    //header高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    //header樣式
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.textColor = .lightGray
        header.textLabel?.font = UIFont(name: "Genkaimincho", size: 18)
        header.contentView.backgroundColor = .black
        
    }
    //點擊儲存格後開啟youtube
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let url = URL(string: "https://www.youtube.com/watch?v=\(movies[indexPath.section].film[indexPath.row].trailer)"){
//            let trailerVC = SFSafariViewController(url: url)
//            present(trailerVC, animated: true)
//        }
//    }

    

    
    //點選儲存格後，透過IBSegueAction，將該儲存格的資料傳至下一頁
    @IBSegueAction func showTrailer(_ coder: NSCoder) -> YoutubeViewController? {
        print("sss")
        if let section = tableView.indexPathForSelectedRow?.section,
           let row = tableView.indexPathForSelectedRow?.row{
            let youtubeVC = YoutubeViewController(coder: coder)
            youtubeVC?.film = movies[section].film[row]
            return youtubeVC
        }
        print("xXX")
        return nil
    }
}
    
