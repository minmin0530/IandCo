//
//  SelfViewController.swift
//  IandCo003
//
//  Created by 泉芳樹 on 2022/02/06.
//

import UIKit
import Charts

class SelfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartView: UIView!
    var chart: CombinedChartView!
    var lineDataSet: LineChartDataSet!
    var bubbleDataSet: BubbleChartDataSet!

    let values: [Double] = [0, 254, 321, 512, 214, 444, 967, 101, 765, 228,
                            726, 253, 20, 123, 512, 448, 557, 223, 465, 291,
                            979, 134, 864, 481, 405, 711, 1106, 411, 455, 761]
    let date : [Double] = [1,2,3,4,5,6,7,8,9,10,
                           11,12,13,14,15,16,17,18,19,20,
                           21,22,23,24,25,26,27,28,29,30]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        //combinedDataを結合グラフに設定する
        let combinedData = CombinedChartData()

        //結合グラフに線グラフのデータ読み出し
        combinedData.lineData = generateLineData()

        //グラフのサイズ設定、座標設定
        chart = CombinedChartView(frame: CGRect(x: 0, y: self.view.frame.height / 10, width: self.view.frame.width, height: self.view.frame.height / 4))

        //chartのデータにcombinedDataを挿入する
        chart.data = combinedData

        //chartを出力
        chartView.addSubview(chart)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func generateLineData() -> LineChartData
    {

        //リストを作り、グラフのデータを追加する方法（GitHubにあったCombinedChartViewとかMPAndroidChartのwikiを参考にしている
        //データを入れていく、多重配列ではないため別々にデータは追加していく

        //DataSetを行うために必要なEntryの変数を作る　データによって入れるデータが違うため複数のentriesが必要になる？
        var entries: [ChartDataEntry] = Array()
        for (i, value) in values.enumerated(){
            entries.append(ChartDataEntry(x: date[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
        }

        //データを送るためのDataSet変数をリストで作る
        var linedata:  [LineChartDataSet] = Array()

        //リストにデータを入れるためにデータを成形している
        //データの数値と名前を決める
        lineDataSet = LineChartDataSet(entries: entries, label: "Line chart unit test data")
        lineDataSet.drawIconsEnabled = false
        //グラフの線の色とマルの色を変えている
        lineDataSet.colors = [NSUIColor.red]
        lineDataSet.circleColors = [NSUIColor.red]
        //上で作ったデータをリストにappendで入れる
        linedata.append(lineDataSet)

        //データを返す。
        return LineChartData(dataSets: linedata)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        values.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelfTableViewCell", for: indexPath) as! SelfTableViewCell
        cell.configure(value: String(values[indexPath.row]), date: String(date[indexPath.row]))
        return cell
    }
}
