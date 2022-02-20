//
//  HomeViewController.swift
//  IandCo003
//
//  Created by 泉芳樹 on 2022/02/02.
//

import UIKit
import Charts

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var drawRaderChartView: DrawRaderChartView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var verticalStackView: UIStackView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var avarageLabel: UILabel!
    var chart: RadarChartView!
    var lineDataSet: LineChartDataSet!
    var bubbleDataSet: BubbleChartDataSet!
    var values: [CGFloat] = []
    var name: [String] = ["実行力", "影響力", "人間関係構築力", "戦略的思考力"]
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = "田中 太郎さん"

        for _ in 0..<4 {
            values.append(CGFloat(Int.random(in: 1...5)))
        }
        tableView.delegate = self
        tableView.dataSource = self

        drawRaderChartView.setMaxPoints(points: values)
        verticalStackView.layer.borderColor = UIColor.black.cgColor
        verticalStackView.layer.borderWidth = 4
        totalLabel.text = "合計：　" + values.reduce(0, +).description
        avarageLabel.text = "平均：　" + (values.reduce(0, +) / CGFloat(values.count)).description
/*
        let mult: Double = 50
        let min: Double = 1


        var entries: [ChartDataEntry] = Array()
        for _ in 0..<name.count {
//            values.append(round(Double.random(in: min...mult)))
            values.append(5.0)
        }
        var i = 0
        for value in values {
            entries.append(RadarChartDataEntry(value: value, data: i))
            i += 1
        }

        let set1 = RadarChartDataSet(entries: entries, label: "Last Week")
        set1.setColor(UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1))
        set1.fillColor = UIColor(red: 103/255, green: 110/255, blue: 129/255, alpha: 1)
        set1.drawFilledEnabled = true
        set1.fillAlpha = 0.7
        set1.lineWidth = 2
        set1.drawHighlightCircleEnabled = true
        set1.setDrawHighlightIndicators(false)

        let data: RadarChartData = RadarChartData(dataSet: set1) //RadarChartData(xVals: set1, dataSet: set2)
        data.setValueFont(.systemFont(ofSize: 8, weight: .light))
        data.setDrawValues(false)
        data.setValueTextColor(.white)

        //グラフのサイズ設定、座標設定
        chart = RadarChartView(frame: CGRect(x: self.view.frame.width / 6, y: self.view.frame.height / 7, width: self.view.frame.width / 3 * 2 , height: self.view.frame.height / 3))

        //chartのデータにcombinedDataを挿入する
        chart.data = data

        //chartを出力
//        chartView.addSubview(chart)
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    func setChart(dataPoints: [String], values: [Double]) {
////        radarChartView.noDataText = "You need to provide data for the chart."
//        var dataEntries: [ChartDataEntry] = []
//        for i in 0..<dataPoints.count {
//            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
//            dataEntries.append(dataEntry)
//        }
//        let chartDataSet = RadarChartDataSet(yVals: dataEntries, label: "Units Sold")
//
//        //Set options...
//
//        //Then set data
//        let chartData = RadarChartData(xVals: subjects, dataSet: chartDataSet)
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        name.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.configure(name:name[indexPath.row], value: values[indexPath.row].description )
        return cell
    }

}
